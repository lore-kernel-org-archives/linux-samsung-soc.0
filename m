Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377421;
	b=yHirvbcFrSGtF1E+jvVqLIbYc+vrjBMA4FaOZtYbLQYrmWkStLtw8COcYTSdpTwdoeyz
	 3bFmKGbN5Fxyea4X/ayaX8PU5UpHuZQaXZY6MddgStRDam78YXcDUJXVV4w2wo7iAxdK9
	 p3SwwU8lRhbpGhiBSIdGlNrHK1T4LCl9g5Gu/7+058+m9lmzkNBnyDmR8vMB5MnAWdMVZ
	 bwiE+Lw2gFD51aX4CviN6morosGLxzEhdmlXT44vaL25Pjztcxapd+ZqnDXKcP1Za+Qof
	 PeqdRc3o3ihUgcZ1huEw62K5OvJ0dBUDQxPhNdnMJNilCjdoCa4UKebkMHRs0U5ULNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=;
	b=Ss1HAX1nXQFydhhLA1g3JSbJ9Z61KxHa29Wnjxf0ppXR3FbHxqJ+tbJp1SL8iod3tTcn
	 wgYblFAlQBfMlt/REReNlBTbcsvxlW3M5aF9SI6YBGye7AENrYQPAzPW86UE6rJi3wdIQ
	 h/BQ/yFVi1DxAvF1dzQzJogpU8HQMyUttTLKbe0Ia9A35RpI9F4tlr28g8qX4iqPxrAcW
	 RuEyNlNVzCTC/tFNAtff26S/+/CIAynVb1/RfPXo8BshXbU1Pf2Rbbj5vozmaYzAvLo33
	 EjKJ04HUVFz/5fYbRDBvFTYuMndok0LeO+I1c2Uire8eH42FXIRuGsyaAcFpcZLjkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgtcXKLi;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547C606A31D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 16:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6547C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XgtcXKLi
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15943c9c005so1549793c88.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377420; x=1793982220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=;
        b=XgtcXKLiYXTxAo/HVRXwkkZT78K7n9ohemQOapb2bgfWp8C/QQTdYer3Bn0wIid+Ou
         jT+jJKgjRVvpgSxdRG4taV4LQnW7782zo/q25AjIO8Wx2NM25rmq9V6UiGXO+WigDq1L
         +uG4lMoY2UiE9GOXGcw4dWEcAuAuNOAEiMf9USmABC6nL4VZ0f4HubTTSeWVr3q4fYBg
         2lkR4YyCurNn6xZc9gaS//SJudwCNPHRpH5jqInUrfp4ouOhzMhtOduJ1osAhDdqfUgs
         kJq6MgjZSqZxXaOsuV8lgByYsjCNRmn0C1WGdUaXhp8nYXe4vL2E1unB3yUmbzOH1lWs
         RXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377420; x=1793982220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0GnmpO+AJdyxic7fk9eFb7rmK6rtUcv8tGjcAKiwQE=;
        b=mzhrDcB3oZxA4z8amQTzlTJnjdJ7s0mp1YdUOZVmlTi0AKu6GiASEHqunfY5GDImCT
         GT3A9BkPUlb7JSaSuf223BzSrhbIRGd8rMgfYZTKN4mzmYfLz8hXlRCeG9N8ohej0PPN
         UhxRyTtkG2wFvy0+TkV0Zp+kn+AI6fWrRzBwYX11AFp72qelnOTyluyWVq8xplvDqLFF
         C/4WrqMOt/putZOe/MisAlPlNhoBk0yC/b6zhMiaQD3KZgMMUwlJzfq54IP+g5e6fW/I
         bIjaP4+UQvX+U//HVEMw81Vug27Mq/WyYLzk3xLR7hjlPIQs75QRKnZJFejFRO193FXk
         1OMg==
X-Forwarded-Encrypted: i=1; AKwUvBx+CzapnlFO9cJILq1km79xj/S/yQINkVJZ0FuUnCJlDUDlrTP2i0A7q3R6PqDGGp2IhTT8VFBDfC9QMeYhrc5KkA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIAzaNWBZlMQGiA/wLocHPGQH8j/OEsrcPLttdLl8/DKfplphUE
	kkrak0DyIImtO5lazEx5uJ/81cXyNSh4/ViCR7NuxL82CbBrybBn3ncc
X-Gm-Gg: AYBFou3cVjmD6vvLcR8a7ZtJ6fQ2Eh1ZjMXD9bpJ1VEKrHitn72tZhIIZ47IyvGCB39
	s2ARlH1fYbNTNQwrJXQ4+pBFyGPpZcJWEpw8+6d5ZUWbUvQuFMFm+sq3RShAKNLv9jhy9M61dvy
	9dHpMti1vNLxBukS2mvS7EXBeicfy+TbeOhyW/odkvisrXOFCXqAk6Mgo4B7QujxGd7MS9x4PME
	497hAnR6J/DjFXzzEBD7rtJz0FuEhhjhNCnqX/IwwAiFORHnl0uWzuH43pPv7u7J9NHtBohEC7c
	OgjUrMBVsT9pjTt7PAfkIvBvDSG2dasR9edsOVLCQgIlTziKmprz9OdRPWLVv2uvyi+iX/AaGOg
	Ac9MGBlA/k4BLW9HfS1i8CNJRmTdkTR+/xMpCgBF9ViXLy2JqCd0N+H8L0UDn8MmRJD1B8UBBhR
	/sa44EZ+UdCTguXw2+A9jCHY82Oj5ovGUAcp/sqikCt4/CQLyWX2JFQy1rs0pgAAeZnukbxq9C4
	ZMc+NT0qR369jmm/n06V/dAwlOR1BTGc/ZXNJN/XZIZ3aih0ruPiMtoVM8xciquBCLyM0yR07OM
	OGzmivvfSnqm93nvttXbtL0iap3onv8NDIRE8maGewWN7OjZB+0azpyGuprYVdKDXtOUH34W9DR
	eTPKxd3TqEgbr58WjCzkmhs5xxMAc+/bEOxV7Oh//v14WmhpU9Um2dNgtlSEfCbft930WWdXVOw
	6wZVa/5ofClwQS1Q==
X-Received: by 2002:a05:701b:4281:20b0:158:1ed2:cb58 with SMTP id a92af1059eb24-1ac5e6f5362mr3896872c88.39.1793377420369;
        Fri, 30 Oct 2026 09:23:40 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm7689041c88.3.2026.10.30.09.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:23:39 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] tty: serial: samsung: use dmaengine_terminate_sync() in release_dma
Date: Fri, 30 Oct 2026 16:23:34 +0000
Message-Id: <20261030162334.3000737-1-samarth.colleges@gmail.com>
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

s3c24xx_serial_release_dma() stops the RX and TX DMA channels using the
deprecated dmaengine_terminate_all() before unmapping their buffers and
freeing the RX buffer. Since this does not guarantee that DMA transfers
or their completion callbacks have finished, the controller may continue
accessing memory after it has been unmapped or returned to the
allocator, particularly when the port is shut down while RX DMA is
active.

Replace dmaengine_terminate_all() with dmaengine_terminate_sync() to
ensure that outstanding DMA activity is terminated before the buffers
are released. Both callers of s3c24xx_serial_release_dma() run in
process context, where synchronous termination is permitted.

Fixes: 62c37eedb74c ("serial: samsung: add dma reqest/release functions")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

On Exynos systems, the UART uses PL330, which does not implement a
device_synchronize callback, so this change follows the DMAengine API
contract without independently establishing that all hardware activity
has stopped. The PL330 termination behavior is being raised separately
with the DMAengine maintainers.

Two related questions outside the scope of this patch:

- s3c24xx_serial_rx_dma_complete() unconditionally re-arms RX DMA,
  potentially racing with release_dma() and submitting another
  descriptor after termination. Should shutdown prevent further
  submissions before terminating the channel?
- s3c24xx_serial_stop_rx() calls dmaengine_pause(dma->tx_chan) before
  checking the RX channel's residue. Should this instead use
  dma->rx_chan?

 drivers/tty/serial/samsung_tty.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d..4eeef149b 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1145,7 +1145,7 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	struct s3c24xx_uart_dma	*dma = p->dma;
 
 	if (dma->rx_chan) {
-		dmaengine_terminate_all(dma->rx_chan);
+		dmaengine_terminate_sync(dma->rx_chan);
 		dma_unmap_single(dmaengine_get_dma_device(dma->rx_chan), dma->rx_addr,
 				 dma->rx_size, DMA_FROM_DEVICE);
 		kfree(dma->rx_buf);
@@ -1154,7 +1154,7 @@ static void s3c24xx_serial_release_dma(struct s3c24xx_uart_port *p)
 	}
 
 	if (dma->tx_chan) {
-		dmaengine_terminate_all(dma->tx_chan);
+		dmaengine_terminate_sync(dma->tx_chan);
 		dma_unmap_single(dmaengine_get_dma_device(dma->tx_chan), dma->tx_addr,
 				 UART_XMIT_SIZE, DMA_TO_DEVICE);
 		dma_release_channel(dma->tx_chan);

base-commit: 83f32c773255720a661aa45d83e36278135f23f5
