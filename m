From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC 3/3] Samsung: DT: Add Device tree for S5PC110/S5PV210 Boards
Date: Thu, 26 Sep 2013 20:14:16 +0200
Message-ID: <4009668.rmW0ykQNyc@amdc1032>
References: <1380214769-7685-1-git-send-email-m.krawczuk@partner.samsung.com>
 <1380214769-7685-4-git-send-email-m.krawczuk@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:65122 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753202Ab3IZSOY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 14:14:24 -0400
In-reply-to: <1380214769-7685-4-git-send-email-m.krawczuk@partner.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, devicetree@vger.kernel.org, t.figa@samsung.com, m.szyprowski@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, t.stanislaws@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>


Hi Mateusz,

On Thursday, September 26, 2013 06:59:29 PM Mateusz Krawczuk wrote:
> Add DTS for s5pc110 boards: goni, aquila, smdkc110
> s5pv210: smdkv210, tiny210
> Torbreck is replaced by FriendlyARM Tiny210 board.

Could you please explain what do you mean by "replaced" here?

Looking at the current board code it should be pretty easy to add
device tree support for Torbreck if needed (it is just a subset of
smdkc110 support + mmc). Then you would have all mach-s5pv210 boards
covered by the device tree and could plan for the removal of non-DT
code in the near future.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
