Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407662;
	b=zomCmrVOi6RZHE7ZQwyC9N4Nlxy9eMUpazXViopj4qmVPTwOG+5E5V8srmiydnZF50Du
	 +I+XK8ZaHSHKLhom3InLbY52HtvBttXzsc3oK180V3AuP8xWJvGpQ6MBeW70QWSFbmALA
	 h+1l1sl2mlXITvOxZaHFAkpP4ObA+kYi7D45Z5ZPAen8juwnT++9JSIvY+U2L7z3eN3gU
	 vg1rsK5qnU62t1njj7fMS2+nOJBfMgBlvQa5+PnLp7BV2YzaZWk8b6UK2uHPHyoRfJl8F
	 YQoydW1yHiFyhYWkHSb64lW+xvYQQ2oNBs+uPzGzrNjpB/DkI03Ir5cZ1JG501vyhGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
	b=LAYQmrxCZbUu8PshhP8SxHAH+rvwV22Ndvxo+m6+eAaUOGcZWwRt4c4McHCT/aztrzuu
	 N7yzQ7XwmYeD2u6Y4oqMNMhjdZP7Y5NlJI7URAzEWwKZnhNHgGs3vFqEPJv3RmCYpATMc
	 CHvrV8IibMVZBueNvENnO81yS4ihtYN7Pd9XIUtPj4vqed5yf/0mmjGtYUskCBwVNq3gC
	 yvICej+tuZqgGVbYkt7ZySg/it25BjyhXRj9aeIGlSArcN3KqgOIHetCYHaLRDLx+bS6c
	 MNprPy3CPcqhsA+TMsmwaxyeNTbyrirIctN5l1LWeDjuHzUsEdkXe7z1l1EhVVc+yDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJRDK+mR;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD0606A31F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 00:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BD0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJRDK+mR
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2195558eec.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 17:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407662; x=1794012462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=IJRDK+mRMeVNqm4z8zkrrkm0GNNjwiXPX2+viPyOK8zgiaefP8s19h7cOcU2VEcWoU
         PqS1XRCbjdYh8/g0znLNQU0essI/+qfLqU2xlyBU4DHp3tNzHFcvrLS2+rOiIVaJCWem
         kEaYuHo6CAuPnj+kPUfjxxsg/uCUZVeAq6n1gCrgRG2swHABFX5Ao65TGHmfT1wmdlg8
         x1WzbkGgr50xX0yR2P3DEtnPnCv35Knv63DNLVKWeUKLGcj6G31LaDCsMW5PoGfP+lrS
         6/DtObogIU9qrRnwiZhPWD0X3MwiZ+ZazfKSBeAVBoGiXe3giW9oRw/gjKDHqMDTKgir
         udqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407662; x=1794012462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=268LSzP9pfFwdbgVDxMqdS0o6I6QpSICZ5YPTlGbOXk=;
        b=pCxa/t7AqwqBWxg7omNPZx/jrYS483PDML9+00GKgOboJM2juZvKjGd62Q7Po8qUB8
         Wi/MDIYKfC0a0urlZTsW8TrhNxwZ/PxMEQrz4y+KjX50ApJ2ZVs0NV5oFUK8errXNio8
         L9DTBF6kKcS779y/Yft7wvFJAtjoI0rlsoq0qFUkj+OyMLZHPx91AaBxIGE/gwlemD6g
         CFOhkSByZRCyzrHwdoccboTBh6/iWsDzWH4KKpCG1nIKIpLtuOv7w0bnNjTpzUNkDn7w
         XQRhmZCOvCZKHJxjWJ/t+8iq5Gsvr8J71XUTg21cAi8fJw2DSSZsYVapv6HYw79gNEht
         DSYA==
X-Forwarded-Encrypted: i=1; AKwUvBz4x/SySaEX/ZGAJHpsC38T89G1le++x7kwRZWUG5Rsq8cj9wZDCpsb6cOA/is77rqLAxIAmdNq+vyhqSLDy1dBvA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhqXih7kxRQXWAPerMdRU1/betC/WfzzFvw825ctwmWT5JG4+O
	UMegfS6caBdYdq5vGHxksM6ev2UK+S+893j1uo92T4HXtibvTEvmeamU
X-Gm-Gg: AYBFou14BBpJ6Y0b3gnzxMkArMatTLk0GtXpuMHYch6QfWIzYmJQfh0De4Cf9PISPIE
	JG/ip4vZYMjeCqCg9fi8QSkF5GmgfA6saelOVjlLlvaMiJMvHh5U97g6CIoT00g29HpEhk8QmcA
	Vrww8kDrn5npEii2Hnkx3h6OsBNPDANbl6HiF0hfmfTt8Cza00TekJzs1UftcYmm5tFzWyR2ioH
	p2uoz23Ku4+zGQ30SFexwhyYVeZ+P+98FIFxjIJaZhKa2TH+DdW+D9dL5NeBsxFiG0dlvN422zF
	pzJMNvzAMqC2lJWAshlHjLOa6177U0R6Ly3LeyCe9uDXrtbVr0JGNZsyYKwN+0Pg1zRZNrNk7F4
	9U2GlLm5dJhpmeO47bC5+Cajztp6CjC9w53o0qwobXwg+lTRNb6jAFe2+RP4fdcGxYf68xgdJfe
	TbUr3Q8pJMQN8P/8mZQTAi6vM+n+9HkFU1ICjG2dA/D9+yJBbHLBxyTdodQRDqSRi5Eqvm8orrl
	xNSgiJSZScI4m6o0+TIDQl5mYC5GJaEXtEjK3XENgC2iGuki2OZu0wkjezhWXO9m1HCfd+2f71I
	yK1YqUyOG9/CUMbGD/wg65iQyb1iG89FiJRwWz1GlFyphph4Exyt/w20C/eBV/kO+xMQI5l9LjW
	hk/WXKgwumu0QyrObMkSJwhC9RXUK2hzzwyNMVEjrUvy6b5rNw4X69Bojbr+94pGqAOmQ/hHe4t
	rG+Zo8mXtgBiKdBMc=
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr5374853eec.13.1793407661421;
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm12703100eec.26.2026.10.30.17.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:47:41 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] serial: TX kfifo underflow when TCOFLUSH races with TX DMA (samsung, sprd, msm, pch_uart, tegra)
Date: Sat, 31 Oct 2026 00:47:33 +0000
Message-Id: <20261031004733.3345841-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The TX FIFO underflow previously fixed in 8250 by 9e512eaaf8f4 ("serial:
8250: Fix fifo underflow on flush") and in qcom-geni by 452d6fa37ae9,
7ea38c49e717, and e3c04834ae1a appears to affect five other serial
drivers. The line numbers below refer to mainline at 83f32c773255.

uart_flush_buffer() resets the transmit kfifo under the port lock before
calling the driver's flush_buffer() callback. If a TX DMA transfer is
still active and the driver does not account for it during the flush,
its completion callback may subsequently call uart_xmit_advance() using
the byte count from the old transfer. This can advance kfifo->out past
kfifo->in, causing kfifo_len() to wrap and the driver to transmit stale
buffer contents. As shown in the 8250 fix, a subsequent close can then
wait in tty_wait_until_sent() until it times out. The issue may arise
when a large write is followed by TCFLSH(TCOFLUSH), or when the port is
closed while TX DMA is active.

Four drivers have no flush_buffer() callback and therefore do not stop
or account for outstanding TX DMA when the kfifo is reset:

1. samsung_tty: Neither s3c64xx_serial_ops (line 1679) nor
   apple_s5l_serial_ops (line 1700) implements flush_buffer(), while
   s3c24xx_serial_tx_dma_complete() advances the kfifo by
   tx_bytes_requested - residue (line 342) without checking whether a
   flush occurred.

2. sprd_serial: serial_sprd_ops (line 944) has no flush_buffer()
   callback, and sprd_complete_tx_dma() advances the kfifo by
   tx_dma.trans_len (line 276).

3. msm_serial: msm_uart_pops (line 1547) does not implement
   flush_buffer(), while msm_complete_tx_dma() advances by
   sg_dma_len(&dma->tx_sg) - residue (line 482). Its check for an
   already stopped transfer relies on tx_sg, which is not cleared by a
   flush.

4. pch_uart: pch_uart_ops (line 1518) has no flush_buffer() callback,
   and pch_dma_tx_complete() advances the kfifo using each scatterlist
   entry's sg_dma_len() (line 756) without holding the port lock.

The fifth driver, serial-tegra, implements tegra_uart_flush_buffer()
(lines 1272-1279), but only clears tx_bytes and calls
dmaengine_terminate_all(). Its completion callback calculates the
transferred byte count from tx_bytes_requested - residue (line 537)
before acquiring the port lock and advances the kfifo afterward (line
540), while tx_bytes_requested is left unchanged by the flush. Although
terminated descriptors do not invoke their callbacks, a completion
already running when the flush occurs, particularly one waiting to
acquire the port lock held by uart_flush_buffer(), may still advance the
reset kfifo. This is the same race addressed by 452d6fa37ae9.

The existing 8250 and qcom-geni fixes provide possible approaches, with
the former clearing the outstanding DMA byte count under the port lock
and the latter marking completions as stale during a flush. As discussed
in 7ea38c49e717, comparing the completion count against kfifo_len()
alone is insufficient.

These findings came from a research static analyzer that checks whether
uart_ops implementations using TX DMA provide flush handling that
accounts for outstanding transfers, followed by manual inspection of the
reported paths. None has been reproduced on hardware. The same analysis
found flush handling in the 8250 core, atmel, fsl_lpuart, imx, sh-sci,
and qcom-geni, while amba-pl011 is not affected because it advances the
kfifo when preparing a transfer rather than on completion.

I would be happy to prepare separate patches for the affected drivers if
the maintainers agree with the analysis.

Thanks,
Samarth
