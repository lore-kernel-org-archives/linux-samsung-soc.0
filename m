From: Pawel Osciak <p.osciak@samsung.com>
Subject: RE: [PATCH 2/6] s3c-fb: Correct FRAMESEL1 bitfield defines for
	VIDINTCON0 register
Date: Tue, 01 Jun 2010 08:49:07 +0200
Message-ID: <000e01cb0156$886ed050$994c70f0$%osciak@samsung.com>
References: <1275296935-2693-1-git-send-email-p.osciak@samsung.com>
 <1275296935-2693-3-git-send-email-p.osciak@samsung.com>
 <20100601041713.GC30276@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29454 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833Ab0FAGt6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jun 2010 02:49:58 -0400
In-reply-to: <20100601041713.GC30276@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@trinity.fluff.org>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org

>Ben Dooks <ben@trinity.fluff.org> wrote:
>
>On Mon, May 31, 2010 at 11:08:51AM +0200, Pawel Osciak wrote:
>> FRAMESEL1 bitfield starts on 13th bit, not on 14th.
>
>is this true for all variants that have FRAMESEL1?

That's at least the case for all the chips I have docs for:
6400, 6410, S5PC100 and V210...

Best regards
--
Pawel Osciak
Linux Platform Group
Samsung Poland R&D Center
