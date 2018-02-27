/*
 * Copyright (c) 2018 Evan Kale
 * Email: EvanKale91@gmail.com
 * Web: www.youtube.com/EvanKale
 * Social: @EvanKale91
 *
 * This file is part of MaxScripts.
 *
 * MaxScripts is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 
-- Make all spline points Z planar

macroScript Spline_Planar_Z category:"EKMax"
tooltip:"Make Spline Planar (Z)"
(
	newZ = $.pos.z
	for s = 1 to (numSplines $) do
	(
		for k = 1 to (numKnots $ s) do
		(
			knotPoint = getKnotPoint $ s k
			inVec = getInVec $ s k
			outVec = getOutVec $ s k
			knotPoint.z = inVec.z = outVec.z = newZ
			setInVec $ s k inVec
			setOutVec $ s k outVec
			setKnotPoint $ s k knotPoint
		)
	)
	updateshape $
)