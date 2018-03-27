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
 
-- Creates a point at selection pivot

macroScript Create_Pivot_Point category:"EKMax"
tooltip:"Create Pivot Point"
(
	fn getPivot obj =
	(
		retPivot = undefined
		
		if(obj != undefined) then
		(
			if(obj == selection) then
			(
				minPivot = [0,0,0]
				maxPivot = [0,0,0]
				
				for i=1 to selection.count do
				(
					if(i==1) then
					(
						minPivot = selection[i].pivot
						maxPivot = selection[i].pivot
					)
					
					else
					(
						if(selection[i].pivot.x < minPivot.x) then
						(
							minPivot.x = selection[i].pivot.x
						)
						else if(selection[i].pivot.x > maxPivot.x) then
						(
							maxPivot.x = selection[i].pivot.x
						)
						
						if(selection[i].pivot.y < minPivot.y) then
						(
							minPivot.y = selection[i].pivot.y
						)
						else if(selection[i].pivot.y > maxPivot.y) then
						(
							maxPivot.y = selection[i].pivot.y
						)
						
						if(selection[i].pivot.z < minPivot.z) then
						(
							minPivot.z = selection[i].pivot.z
						)
						else if(selection[i].pivot.z > maxPivot.z) then
						(
							maxPivot.z = selection[i].pivot.z
						)
					)
				)
				
				retPivot = (minPivot + maxPivot)/2;
			)	
			else
			(
				retPivot=obj.pivot
			)
		)
		
		return retPivot
	)
	
	
	if($ != undefined) then
	(
		selected = $

		pivotName="Selection"

		if($ != selection) then
		(
			pivotName = $.name
		)	
		
		pivotPoint = getPivot($) 
		
		Point name:(pivotName+"Pivot") pos:pivotPoint isSelected:on centermarker:on axistripod:off cross:on Box:off size:10 constantscreensize:on drawontop:on
		$.wirecolor = color 87 225 198
		
		select selected
	)
)

