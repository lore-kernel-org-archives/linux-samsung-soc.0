From: "Burke, Zachary" <Zachary.Burke@digimarc.com>
Subject: Exynos 4xxx Camera Image Filtering
Date: Wed, 12 Sep 2012 18:43:10 +0000
Message-ID: <7F1C005B6D42174DB9BF844CD0F55B9D257C3AE8@PDX-P-EX-C2A.corp.digimarc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp4.digimarc.com ([12.232.235.203]:57912 "EHLO
	smtp4.digimarc.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755322Ab2ILSnM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Sep 2012 14:43:12 -0400
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello, I am looking for someone with knowledge of the camera image proc=
essing path on Exynos 4xxx chips.=A0 On the devices available to us (Ex=
ynos 4412 and 4212 in the Galaxy Note 10.1 and Galaxy S3) there appears=
 to be noise reduction/filtering occurring in the camera image acquisit=
ion processing path.

This is problematic for us as our embedded watermarks are being filtere=
d out of preview frames along with the noise.=A0 In the past we found T=
I doing similar filtering on the omap4xxx chip, these chips exposed ima=
ge post-processing parameters to disable the noise suppression filter.=A0=
 These parameters are defined in:
hardware/ti/omap4xxx/camera/TICameraParameters.cpp

I am looking for similar functionality on Exynos chips.=A0 I have looke=
d through the kernel source for the galaxy tab (GT-N8013_ICS_Opensource=
) but cannot find evidence of post-processing parameters exposed in the=
 camera driver.

Can anyone answer the question - Can I disable noise filtering on Exyno=
s?

Regards,
Zachary
