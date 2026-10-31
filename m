Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450373;
	b=ahEJAmuuHMMfx+3ki2FFuqr0QBMaOyj4YuB6CbqsQcnEQPFElPGxqSH6/Sc9PiGb7OjX
	 m3AEIdyQqqIPAREyFeNpxeQB08pGBESxsdz38mNyBqxtCzKxJFPtm8dsgT1kM0Cfda5gH
	 ZQ20QSj5uws/Gu6RR+56C3m1HPKpplxrSmW8aF+uq8G3pZhxLTy0KrbP/7guup/2tPlgU
	 v6goIw+t6Wqkg0Xo8m7K9740xl6wCwZi0pAfSFlFCBMUXhf1CUfMSQHmixLkKr96kYL/w
	 MvQ1skObGPnjbDW6V0+A3YM5+N7CGWqoCyqqY2I8+vo2KIxv+f+Exr5tGL5EOUMonaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
	b=cX/3jxdrH0jo/dqPnsCzByAhCSERM8gK5SPmAmjMSAJNllwkZAKQcMJbzMQPgVX2WsX/
	 j6khH8kBySV8+eKZGHUq/zzagwPfGQe2HUHFJeSsN8MjrIoAbxJCVVzfFNVklPkZZhMfA
	 kc58eIF+H3IYvfwgv+3jtLqdtbYjVwJlykyg5MTKoQ0QStKP+DbBiEvCJsGc2RHJ05XF/
	 raPIUC4c96xcbRrEXbsvydCzhY/C703vartDllGDbGb+3qr/EwOxqNvbhE1DsZoWrKIU/
	 d9q4SYzNMxL7E5HQQg3ypAywedJhB6v+J8FKt5jNxhDJaX7InQKQrzIKWrshq2mqNsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMeYLSu8;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709B606A322
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 12:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0709B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MMeYLSu8
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1438d9363fbso1201697c88.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450372; x=1794055172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=MMeYLSu8Hfxb4MMwRmB6e+af88Re5khoHp3/t2EUBiUGkWoq5iAZ1cjS/455NZJMYc
         IujJzHWomO3jTDNhqb6DoiExYizct5Q5FVUJmFS7XuCy2LxUc8jj0Oofyc0IHl+EntE/
         eUcP2z4Ax8+oIgGKpmcRfzMrD9dQdamJcuC3zrvef27BS8pSvZievFDvuWoZs0CqMcCq
         3vKRYyOQMEzwBfi2Zm0+f/C1csutboBvSRGc8Yte8xi/BQo0n10Jw6RwB6XCFvO+KJ09
         hZWMahyBeZ0zoMbqMmuxiabU6Q9VNG+7uRaQgI//VnxikZbVXNq/V6EAx1/ZV4NVzTzt
         LUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450372; x=1794055172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sU9FonDcj7pItReaQHsb8l5aj4324fAJTqMBMqrSuhE=;
        b=Qds8lC5518qb40QEysnTtjGqlLZpjKXS7ZRJNsY4QleZ03mmle/WJ/Ua/bL8UxNzrI
         h3kb+zP2iX452O86aDdCjIFle7Moabrk7VUkkQrSsWhqz2pDyaX9oM2fUQXSa5je3aCS
         Ck96OAz5BCNwhM6elz73Esoyl3wwRFBKwzM3Bu07RgtOwGDtRUdCQTbOzJoHK6lzBOej
         6EvcWXVwBfxuY1FQnlUavukXbs9B6H7zkHWPF9MHqS9N1Ugco3r86cmXwke0HM8O+v07
         jnIf4pxDAuB0Mm56gbyjhEu6gvYUD/Z/3iHVIrtZ9CH938/19tNd7h38t1rh93mC1Wmz
         qxLw==
X-Forwarded-Encrypted: i=1; AKwUvByKukudn9WaAJsF9UYlLKDsYm7/4BETJrRvOUZ/+cJvxf91x4iI3JxP12/gdwt0bSeFTuoaDFRIpTszbCbnAeTCCw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKacDVuMy6wxbtRs/F2Gz48vYRGV1m2bkkOJJcMQm+6UtyldFXK
	uTAxSJs7hNps0LuoAeRbSgTAurq4rJqh/Ruiyu/aOeRhq2trEhiPfGz7
X-Gm-Gg: AYBFou0oSGXd6xv8GtIA3Pm/OlkhCcXBnE9MpBCg4g7L9IlZiibL4hnwJM/CoQFc0xm
	eLCBJQ3psCX0dU8HDzh+FSaMaWG78/5vPKcuazVRKHQIyeKP8AFxF0WLGJTzTOI8VHn2vBZr052
	uBiooGyBl7lc2OBYQvhR/CpNmfbOpte75AYFJKUDlC0CwjPhS0PAtAyQJgYHFcby1TqXJI0txFN
	qKV2R/jNUTPrpf6Q1RCEKox6jyo7r6GwfJWsFjz1guGqOfqz2DgtWdf5DVT1Ae9eD5aF1Lg69lA
	qV6nAd3KAVJ3h9dZwVSzt0BG3Hk2zzc6IEV5Zgz3welPClnkPUwjGPLjDipVkUAdt7wgVM/pNKR
	PLu0fJWtctz48lgAWoICT57zsLSj4KbfKDc+d2ZwKoHAjvXta7Z5aF174+oOzgI0b6Z7+ybTCz6
	2i3ZHU7+U6k1qKBU2niIW0hmB5cvRgzTnDv8brp39PqmaKzwVl0edu/u+PNAoxMIxzA9rYzNMiq
	+WWWUynSY+jdvDa7SxGlSc1kNsOMifDdCJug97L/RXwkQ8QyTLpTsEB2WrZBdJ84tcCAIDteW11
	9fZpof2imS5Wn7+zVorLJGiB4yI1He+h3fBo+en1OUTOHwsi09LUFY1yGLYPyvvPiPy4M9AU50y
	dD7gkNhB2O2uyNWJZV1Yxs6YUeFDWVK/tuE021YItXF9tgfdNX8tbnS3S1bH+zpvPfufyIvCRvN
	6Hg3UOSOgpVJOvIw==
X-Received: by 2002:a05:7022:294:20b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1ac5bda4837mr6575924c88.18.1793450371863;
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm21566039c88.6.2026.10.31.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:39:31 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] serial: tegra: don't advance the TX kfifo for a flushed transfer
Date: Sat, 31 Oct 2026 12:39:08 +0000
Message-Id: <20261031123911.3784690-3-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
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

tegra_uart_flush_buffer() terminates the TX DMA transfer after the
serial core has reset the transmit kfifo, but leaves tx_in_progress set.
A completion callback that was already running may have calculated its
byte count from tx_bytes_requested before acquiring the port lock,
allowing it to call uart_xmit_advance() on the reset kfifo after the
flush. This can advance the kfifo tail past its head, causing
kfifo_len() to wrap and the driver to transmit stale buffer contents.
The same race was fixed in qcom-geni by commit 452d6fa37ae9 ("serial:
qcom_geni: fix kfifo underflow when flush precedes DMA completion IRQ").

Clear tx_in_progress in the flush hook and have the completion callback
skip the kfifo update if the transfer has already been retired by either
the flush or tegra_uart_stop_tx(), which also advances the kfifo itself.

Fixes: e9ea096dd225 ("serial: tegra: add serial driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/serial-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index b0fc4ae3686f..8b712a9bc293 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -537,6 +537,11 @@ static void tegra_uart_tx_dma_complete(void *args)
 	count = tup->tx_bytes_requested - state.residue;
 	async_tx_ack(tup->tx_dma_desc);
 	uart_port_lock_irqsave(&tup->uport, &flags);
+	/* Already retired by stop_tx or flush_buffer */
+	if (tup->tx_in_progress != TEGRA_UART_TX_DMA) {
+		uart_port_unlock_irqrestore(&tup->uport, flags);
+		return;
+	}
 	uart_xmit_advance(&tup->uport, count);
 	tup->tx_in_progress = 0;
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
@@ -1276,6 +1281,9 @@ static void tegra_uart_flush_buffer(struct uart_port *u)
 	tup->tx_bytes = 0;
 	if (tup->tx_dma_chan)
 		dmaengine_terminate_all(tup->tx_dma_chan);
+	/* The kfifo has been reset: the completion must not advance it */
+	if (tup->tx_in_progress == TEGRA_UART_TX_DMA)
+		tup->tx_in_progress = 0;
 }
 
 static void tegra_uart_shutdown(struct uart_port *u)
-- 
2.34.1

