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

-- Import a to scale reference image as plane

macroScript Import_Ref_Image category:"EKMax"
tooltip:"Import Reference Image"
(

	rollout InputDialog "Import Reference Image"
	(
			local inputStr
		
			Label label01 "Image path:"
			EditText editText01
		
			on InputDialog open do
			(
				setFocus editText01
			)
		
			on editText01 entered arg do
			(
				DestroyDialog InputDialog
				inputStr = arg
			)
	)

	CreateDialog InputDialog modal:true
	textureFilename = InputDialog.inputStr
	
	if (textureFilename != undefined) then
	(
		bmpText = BitmapTexture fileName:textureFilename 

		DPI = 600.0
		INCH_TO_MM = 25.4

		plLength = (bmpText.bitmap.height/dpi) * INCH_TO_MM
		plWidth = (bmpText.bitmap.width/dpi) * INCH_TO_MM

		texturePlane = Plane length:plLength width:plWidth lengthsegs:1 widthsegs:1 pos:[0,0,0] isSelected:on
		texturePlane.material = Standard diffuseMap:bmpText showInViewport:true selfIllumAmount:100
	)
)