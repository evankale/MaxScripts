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
 
-- Decrease selected object visibility

macroScript Decrease_Visibility category:"EKMax"
tooltip:"Decrease Visibility"
(
	fn decreaseVis obj =
	(
		obj.visibility = Bezier_float()	
		if(obj.visibility.controller.value > 0.5)
		then(obj.visibility.controller.value = 0.5)
		else if(obj.visibility.controller.value > 0.25)
		then(obj.visibility.controller.value = 0.25)
		else if(obj.visibility.controller.value > 0.1)
		then(obj.visibility.controller.value = 0.1)	
		notifyDependents obj	
	)
	
	if($ == selection) then
	(
		for i=1 to selection.count do
		(
			decreaseVis(selection[i])
		)
	)	
	else
	(
		decreaseVis($)
	)
)

