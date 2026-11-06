Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959745;
	b=d/WD78DDJEt6NcoMsFjyNV63K31FkkWvidJJ7UKf3kf269FYn2ksmG0ADetLiDa8iXCL
	 lfuOt3R6UMkeSk7QPrqpQx4irIBBNfgDSezlERT3Affx+rjILHM/GH5/7t0HNyMmXODwJ
	 t6jAfLWdRBrbGPN4m3FBWTG1DtRLcQFlH8T6qrDfrNUnGDAsg4zR2qa+xeopdCr1BtKPZ
	 k4EMDQs+MYr5Ht2z7BW1OdkvJTm42tcNen63Aw8ByqM/7lO7ZWoUz20wHO8BPrizzGQnB
	 R6p/Q/c77n3utDu0VXcsjaScALpGbpz/LRtNbLGH1wU+trR1T+bbE/hwu6WaNhsNjSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959745;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=OzxYqfOe5wWDr5TtA6JkHbhEc949LE7biXmqyPX/UII=;
	b=KwlTJcUcpXCrsDgqy/Z475WnDkSI8nT17530BUBqjB8gURJHYB+2X100ASGUIGALkJMN
	 tJFAm1QWsQAXFzGsPi1R0MunF2kGFuFhG2HROuv36yV6ECpCWVbn2rOBa1rmfx+EHed/T
	 ijK5rksxraLTTPuXg68U3y9dmqV7dgfQv1h7sPyC59Km8WePA7HLn9CGw4yoS5OHHUddf
	 IlDpJNldtlQhI1BrXp69WhbCftCxSRucZJjxGaRuPeMSblUUqCtyvi0wwIVmnd/7mwSJg
	 Y5IHT4s0b0nLz+efRj9iLPzDWvHVn2rKVIISQK1l5U4pq2Mb4Jz+ZOq0SRYuMAGsQBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rUKlc1j3;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6EC606A326
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 10:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rUKlc1j3
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106100901euoutp02fa33bdac181535821eb896fd3558d430~lbOE-AJjf3133831338euoutp02c
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 10:09:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106100901euoutp02fa33bdac181535821eb896fd3558d430~lbOE-AJjf3133831338euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793959741;
	bh=OzxYqfOe5wWDr5TtA6JkHbhEc949LE7biXmqyPX/UII=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rUKlc1j37YyfGc+HQ/BKO8+uZNtc/axmEYXEiJAe0QD64UvCTpKdbeWGu/8Qr9tfw
	 BG+Y52dLM40scveAFebI8KUIbaz7mcnysg4cFApxGoeNMgjerj1YxTqoHaJ6sbnfRv
	 drpKbTz4wEvEmjpm+jsIZNQU3Vd4O5dcuXoOGvxE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106100900eucas1p267f037803dde62c10657cc3e34ee405e~lbOEu4IHM1522315223eucas1p2j;
	Fri,  6 Nov 2026 10:09:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106100859eusmtip13b5cf4c16eea4ef916d8542234814384~lbODrujOM0555205552eusmtip1w;
	Fri,  6 Nov 2026 10:08:59 +0000 (GMT)
Message-ID: <f1180687-6e4d-4d76-9a09-bb20d3676099@samsung.com>
Date: Fri, 6 Nov 2026 11:08:59 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 1/2] tty: serial: samsung: pause the RX DMA channel in
 stop_rx
To: Samarth Narang <samarth.colleges@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Greg
	Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261031004217.3340610-2-samarth.colleges@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261106100900eucas1p267f037803dde62c10657cc3e34ee405e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261031004233eucas1p241e1ded0d1050e67eeb170026da382c7
X-EPHeader: CA
X-CMS-RootMailID: 20261031004233eucas1p241e1ded0d1050e67eeb170026da382c7
References: <20261031004217.3340610-1-samarth.colleges@gmail.com>
	<CGME20261031004233eucas1p241e1ded0d1050e67eeb170026da382c7@eucas1p2.samsung.com>
	<20261031004217.3340610-2-samarth.colleges@gmail.com>

On 31.10.2026 01:42, Samarth Narang wrote:
> In s3c24xx_serial_stop_rx(), the driver pauses dma->tx_chan before
> reading the residue of the RX transfer on dma->rx_chan to determine how
> many bytes have been received. Since pausing the TX channel does not
> stop RX DMA, additional bytes may arrive before the RX channel is
> terminated, causing them to be omitted from the data passed to the tty.
> This also unnecessarily pauses an active TX transfer, which the driver
> does not subsequently resume.
>
> Pause the RX channel instead, following the existing handling in
> s3c24xx_serial_rx_chars_dma() on the RX timeout path.
>
> Fixes: b543c301c2c5 ("serial: samsung: add DMA support for RX")
> Link: https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>

That's a real, long standing issue.

Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  drivers/tty/serial/samsung_tty.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 4eeef149b..2f6c69bec 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -553,7 +553,7 @@ static void s3c24xx_serial_stop_rx(struct uart_port *port)
>  		ourport->rx_enabled = 0;
>  	}
>  	if (dma && dma->rx_chan) {
> -		dmaengine_pause(dma->tx_chan);
> +		dmaengine_pause(dma->rx_chan);
>  		dma_status = dmaengine_tx_status(dma->rx_chan,
>  				dma->rx_cookie, &state);
>  		if (dma_status == DMA_IN_PROGRESS ||

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

