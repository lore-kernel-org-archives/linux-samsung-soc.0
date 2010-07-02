From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH v3 05/12] s3c-fb: Add support for display panning
Date: Fri, 02 Jul 2010 13:33:12 +0200
Message-ID: <4C2DCE78.6090202@gmail.com>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>	<1277712538-23188-6-git-send-email-p.osciak@samsung.com> <4C288779.8040702@gmail.com> <4C2DCCAD.9080306@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:64285 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753811Ab0GBLdP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 07:33:15 -0400
In-Reply-To: <4C2DCCAD.9080306@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: Pawel Osciak <p.osciak@samsung.com>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

 Op 02-07-10 13:25, Ben Dooks schreef:
> On 28/06/10 12:28, Maurus Cuelenaere wrote:
>>  Op 28-06-10 10:08, Pawel Osciak schreef:
>>> Supports all bpp modes.
>>>
>>> The PRTCON register is used to disable in-hardware updates of registers
>>> that store start and end addresses of framebuffer memory. This prevents
>>> display corruption in case we do not make it before VSYNC with updating
>>> them atomically. With this feature there is no need to wait for a VSYNC
>>> interrupt before each such update.
>>>
>>> Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>>  arch/arm/plat-samsung/include/plat/regs-fb.h |    5 ++
>>>  drivers/video/s3c-fb.c                       |   71 ++++++++++++++++++++++++++
>>>  2 files changed, 76 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/plat-samsung/include/plat/regs-fb.h b/arch/arm/plat-samsung/include/plat/regs-fb.h
>>> index ac10013..f454e32 100644
>>> --- a/arch/arm/plat-samsung/include/plat/regs-fb.h
>>> +++ b/arch/arm/plat-samsung/include/plat/regs-fb.h
>>> @@ -112,6 +112,11 @@
>>>  #define VIDCON2_ORGYCbCr			(1 << 8)
>>>  #define VIDCON2_YUVORDCrCb			(1 << 7)
>>>  
>>> +/* PRTCON (S3C6410, S5PC100) */
>>> +
>>> +#define PRTCON					(0x0c)
>>> +#define PRTCON_PROTECT				(1 << 11)
>>> +
>>>  /* VIDTCON0 */
>>>  
>>>  #define VIDTCON0_VBPDE_MASK			(0xff << 24)
>>> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
>>> index 59ac76a..4f3680d 100644
>>> --- a/drivers/video/s3c-fb.c
>>> +++ b/drivers/video/s3c-fb.c
>>> @@ -71,6 +71,7 @@ struct s3c_fb;
>>>   * @buf_end: Offset of buffer end registers.
>>>   * @osd: The base for the OSD registers.
>>>   * @palette: Address of palette memory, or 0 if none.
>>> + * @has_prtcon: Set if has PRTCON register.
>>>   */
>>>  struct s3c_fb_variant {
>>>  	unsigned int	is_2443:1;
>>> @@ -85,6 +86,8 @@ struct s3c_fb_variant {
>>>  	unsigned short	osd;
>>>  	unsigned short	osd_stride;
>>>  	unsigned short	palette[S3C_FB_MAX_WIN];
>>> +
>>> +	unsigned int	has_prtcon:1;
>>>  };
>>>  
>>>  /**
>>> @@ -379,6 +382,9 @@ static int s3c_fb_set_par(struct fb_info *info)
>>>  
>>>  	info->fix.line_length = (var->xres_virtual * var->bits_per_pixel) / 8;
>>>  
>>> +	info->fix.xpanstep = info->var.xres_virtual > info->var.xres ? 1 : 0;
>>> +	info->fix.ypanstep = info->var.yres_virtual > info->var.yres ? 1 : 0;
>> No need for the '? 1 : 0'
> I tihnk there is, IIRC there is no neccessity for a compiler to produce
> one for true, just that the result be !0

Hmm ok, I only checked this using GCC 4.4.3 and this:

#include <stdio.h>
#include <stdbool.h>

int main(void) {
    printf("%d %d\n", (int)(1 > 2), (int)(1 < 2));   // gives 0 1
    printf("%d %d\n", (bool)(1 > 2), (bool)(1 < 2)); // gives 0 1

    return 0;
}

-- 
Maurus Cuelenaere
