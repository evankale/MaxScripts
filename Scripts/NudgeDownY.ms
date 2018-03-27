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
 
-- Nudge Y negative direction by grid spacing amount

macroScript NudgeDownY category:"EKMax"
tooltip:"Nudge Down Y"
(
	-- Down Y Axis
	nudgeUnitVec = [0,-1,0]
	
	refCoordSys = getRefCoordSys()
	currSubObjectLevel = subObjectLevel	
	nudgeVec = nudgeUnitVec * gridPrefs.spacing
	
	if(refCoordSys != #local) then
	(
		refCoordSys = #world
	)
	
	if (currSubObjectLevel == undefined or currSubObjectLevel == 0) then
	(
		in coordsys refCoordSys move $ nudgeVec
	)
	else
	(
		$.modifiers[#Edit_Poly].SetOperation #Transform
		in coordsys refCoordSys $.modifiers[#Edit_Poly].MoveSelection nudgeVec
		$.modifiers[#Edit_Poly].Commit ()
	)
)
