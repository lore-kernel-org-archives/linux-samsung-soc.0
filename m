From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 07/13] tests/exynos: use XRGB8888 for framebuffer
Date: Fri, 30 Oct 2015 12:17:02 +0100
Message-ID: <563351AE.4020301@math.uni-bielefeld.de>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442937302-8211-8-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20151030154110.6e458145@hwh-ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57620 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1030667AbbJ3LRE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 07:17:04 -0400
In-Reply-To: <20151030154110.6e458145@hwh-ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Hyungwon,


Hyungwon Hwang wrote:
> On Tue, 22 Sep 2015 17:54:56 +0200
> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> 
>> This matches the G2D color mode that is used in the entire code.
>> The previous (incorrect) RGBA8888 would only work since the
>> Exynos mixer did its configuration based on the bpp, and not
>> based on the actual pixelformat.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  tests/exynos/exynos_fimg2d_test.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/exynos/exynos_fimg2d_test.c
>> b/tests/exynos/exynos_fimg2d_test.c index 8794dac..dfb00a0 100644
>> --- a/tests/exynos/exynos_fimg2d_test.c
>> +++ b/tests/exynos/exynos_fimg2d_test.c
>> @@ -675,7 +675,7 @@ int main(int argc, char **argv)
>>  	offsets[0] = 0;
>>  
>>  	ret = drmModeAddFB2(dev->fd, screen_width, screen_height,
>> -				DRM_FORMAT_RGBA8888, handles,
>> +				DRM_FORMAT_XRGB8888, handles,
>>  				pitches, offsets, &fb_id, 0);
> 
> Reviewed-by: Hyungwon Hwang <human.hwang@samsung.com>
> 
> Nice catch. It's right, if there was no previous setting for source
> image color mode. But I think it could be the source image color mode
> was set by another application before when this test runs. So I think
> the code which sets the source image color mode must be added.
I think you misunderstand something here. First of all settings from
anither application using DRM don't carry over.

The point for this change is that all used G2D image structures have the
color_mode field set to G2D_COLOR_FMT_ARGB8888 | G2D_ORDER_AXRGB. So the
G2D is operating on ARGB8888 pixel data.

However the framebuffer is set to DRM_FORMAT_RGBA8888, which obviously
is wrong since this is not the type of data we put into the framebuffer.


With best wishes,
Tobias


> 
> Best regards,
> Hyungwon Hwang
> 
> 
>>  	if (ret < 0)
>>  		goto err_destroy_buffer;
> 
