From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ASoC: samsung: Add 'mclk' handling for Snow sound-card
 driver
Date: Wed, 21 May 2014 11:11:02 +0530
Message-ID: <537C3C6E.6010207@linaro.org>
References: <1400559942-5666-1-git-send-email-tushar.behera@linaro.org> <20140520111600.GL12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:37222 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796AbaEUFlI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 01:41:08 -0400
Received: by mail-pd0-f169.google.com with SMTP id w10so1048462pde.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 May 2014 22:41:07 -0700 (PDT)
In-Reply-To: <20140520111600.GL12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, sbkim73@samsung.com, rdunlap@infradead.org, dianders@chromium.org, t.figa@samsung.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/20/2014 04:46 PM, Mark Brown wrote:
> On Tue, May 20, 2014 at 09:55:42AM +0530, Tushar Behera wrote:
>> For audio to work on Snow board, we need the codec master clock
>> 'mclk' to be properly configured.
>> 
>> Currently XCLKOUT is configured as 'mclk' for codec chip and it
>> is required to be clocked at 24MHz for the codec to work
>> properly.
>> 
>> Add appropriate clock handling within Snow sound-card driver to
>> set 'mclk' to operate at 24MHz.
> 
> The clock here is connected to the CODEC on the board so it should
> be connected to the CODEC in the device tree too.
> 

Ok. I will move 'mclk' clock handling to respective CODEC drivers.

- -- 
Tushar Behera
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTfDxtAAoJELqclMPPkq4NkPcH/2fOwVTGgmGFarm2RSoxJcON
QcSQlNpVXEpAqslVdz+ay7VkYCWy+wiuTq4Fe/Yw5RK/Pl7DdkEX/Ltj7/Q6+CbT
38r6o5PSbZLlPcBxVjGXBiOTpK7PZLumF8c1DK4/6HzsHYDzLGTvbWVi6cy9kZzj
X3glD3PBiK/NL12IuOHsRg2wzBRE56RQCmfT2kPueWHEklebGzr/qv5UgdGWa+jb
JRVDt11klGfvIFj+Ov28yave1epzFEzrNm4ixso8MJN7J9HxlufagTheS0HkDpuX
+uY8PbRFTAdT7pjvZR4n2lPws940nk7aUqyVPTQaG9JVKk7R4FVZgBwmhMeIsMU=
=eKSS
-----END PGP SIGNATURE-----
