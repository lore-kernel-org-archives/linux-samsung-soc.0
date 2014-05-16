From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH 1/2] s5p-mfc: Update mfc-v6 firmware
Date: Fri, 16 May 2014 11:54:31 +0200
Message-ID: <04be01cf70ec$d5f37a10$81da6e30$%debski@samsung.com>
References: <1400233490-5677-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27580 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756489AbaEPJyR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 05:54:17 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5N00GD8VICKG00@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 May 2014 10:54:12 +0100 (BST)
In-reply-to: <1400233490-5677-1-git-send-email-arun.kk@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arun Kumar K' <arun.kk@samsung.com>, dwmw2@infradead.org, ben@decadent.org.uk, linux-samsung-soc@vger.kernel.org
Cc: arunkk.samsung@gmail.com

Hi Arun,

I asked you to put old and new v6 firmware in separate files.
You should also mention in the commit message that this new firmware
will not work with the s5p-mfc driver without the patch you recently
submitted to linux-media mailing list. Please also add a link to the
thread with the necessary patch.

In addition to the above I think a readme/description file should be
added to the s5p-mfc folder. The issue of firmware for v6 should be
explained, so that no one is surprised that something does not work.

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland


> -----Original Message-----
> From: Arun Kumar K [mailto:arunkk.samsung@gmail.com] On Behalf Of Arun
> Kumar K
> Sent: Friday, May 16, 2014 11:45 AM
> To: dwmw2@infradead.org; ben@decadent.org.uk; linux-samsung-
> soc@vger.kernel.org
> Cc: k.debski@samsung.com; arunkk.samsung@gmail.com
> Subject: [PATCH 1/2] s5p-mfc: Update mfc-v6 firmware
> 
> This is the newer version of s5p-mfc-v6.fw with many
> fixes and enhancements.
> 
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  s5p-mfc/s5p-mfc-v6.fw |  Bin 306312 -> 343756 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/s5p-mfc/s5p-mfc-v6.fw b/s5p-mfc/s5p-mfc-v6.fw
> index
> 2e1179fa6d227f1c5a23f78b4834be336e579f50..9d3345fbf4abb7ea7389816916d68
> 57d64732380 100644
> GIT binary patch
> literal 343756

[snip]
