From: Pawel Osciak <p.osciak@samsung.com>
Subject: RE: [PATCH v3 03/12] s3c-fb: Separate S5PC100 and S5PV210 framebuffer
 driver data structures
Date: Fri, 02 Jul 2010 15:05:20 +0200
Message-ID: <003d01cb19e7$39c7db50$ad5791f0$%osciak@samsung.com>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>
 <1277712538-23188-4-git-send-email-p.osciak@samsung.com>
 <4C2DC986.7040705@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42370 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758566Ab0GBNGb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 09:06:31 -0400
In-reply-to: <4C2DC986.7040705@simtec.co.uk>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@simtec.co.uk>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>

> Ben Dooks <ben@simtec.co.uk> wrote:
>On 28/06/10 09:08, Pawel Osciak wrote:
>> S5PC100 and S5PV210 framebuffer devices differ slightly in terms of
>> available registers and their driver data structures have to be separate.
>
>Would have been nice to note which ones changes, otherwise ok.

For this series, the difference is the existence of PRTCON and SHADOWCON
registers. There are more AFAIR. I am not sure if it'd be a good place
to list all of them though...

Best regards
--
Pawel Osciak
Linux Platform Group
Samsung Poland R&D Center
