From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] serial: samsung: Use right device for DMA-mapping calls
Date: Thu, 23 Mar 2017 12:02:33 +0100
Message-ID: <1532359.gLsId1u0ER@amdc3058>
References: <CGME20170323074548eucas1p142511884e12d6211bebd9cbabde2f9c9@eucas1p1.samsung.com>
 <1490255131-9597-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37319 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751170AbdCWLCm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Mar 2017 07:02:42 -0400
In-reply-to: <1490255131-9597-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>, stable@vger.kernel.org


Hi,

On Thursday, March 23, 2017 08:45:21 AM Marek Szyprowski wrote:
> Driver should provide its own struct device for all DMA-mapping calls instead
> of extracting device pointer from DMA engine channel.
> 
> Reported-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> Fixes: 2c37eedb74c8 ("serial: samsung: add dma reqest/release functions")

The right commit id is 62c37eedb74c8.

> CC: stable@vger.kernel.org # v4.0+
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
