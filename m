From: Pawel Osciak <p.osciak@samsung.com>
Subject: RE: [PATCH v3 01/12] s3c-fb: Fix various null references on
 framebuffer memory alloc failure
Date: Fri, 02 Jul 2010 14:56:06 +0200
Message-ID: <003c01cb19e5$ef8c5df0$cea519d0$%osciak@samsung.com>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>
 <1277712538-23188-2-git-send-email-p.osciak@samsung.com>
 <4C2DB6A2.2040005@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41676 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758368Ab0GBM5R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 08:57:17 -0400
In-reply-to: <4C2DB6A2.2040005@simtec.co.uk>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@simtec.co.uk>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>

>Ben Dooks <ben@simtec.co.uk> wrote:
>On 28/06/10 09:08, Pawel Osciak wrote:
>> @@ -819,7 +820,8 @@ static void s3c_fb_release_win(struct s3c_fb *sfb,
>struct s3c_fb_win *win)
>>  {
>>  	if (win->fbinfo) {
>>  		unregister_framebuffer(win->fbinfo);
>> -		fb_dealloc_cmap(&win->fbinfo->cmap);
>> +		if (&win->fbinfo->cmap)
>> +			fb_dealloc_cmap(&win->fbinfo->cmap);
>
>did you really mean &win->fbinfo->cmap? surely that will end up
>always evaluating to true?
>

It should have actually been:

+		if (win->fbinfo->cmap.len)
+			fb_dealloc_cmap(&win->fbinfo->cmap);

Thanks, will post a fix for this patch.


Best regards
--
Pawel Osciak
Linux Platform Group
Samsung Poland R&D Center
