Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407348;
	b=p1mi3In5yCchOjxe5gUELQEceRh+K7ziHxsuMoOJjKX6EKB/EyfCkLfOLeeGf3j0hoZT
	 pvcLITAXcWoTO2TtfY87uF6jsA1l8z+ZqKsRM8jhJUrM0Jm4H4cLrqrqJo/ZfHeBsgjOk
	 nVVS7R7aZWGbu8A9KGy0R7vl5Ly7/jKK39aaq33FLAcYL+dMCVrJe+Szf85t+FLOkBu6T
	 tknZM8Vh0MvPt4Ee+G1Rk04/V5qL4quAj2lObnzCSdaD3TSboHjUmParBQlRBII3UqgGX
	 Cq9LDwHFE+LidiFCHEgY/gJovJge4wB1yw9Q4b8ZzFcMSYchMVC8EyHAa79tnOZcIxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=;
	b=SZJqKJBRpgngz8PS4gZsuP86PcbbUWudUpleDdARvQs18wx1YTU/jB1DZjQB6yc4TE2t
	 3L4k3Z+VHWCqbknvt5fBlD0SBaoPkV0NYgigT8z6aHtAcu+H5KbkvruZQ3AmPKt0zsoLA
	 I1dKMvnBUAajJ309iea0lDRXKliHgKv16hT2Dn7+48yEkhkobVNN1rUg7NH9RVw1HaZ+J
	 q7zrXcMbjDz/n5UslO3V9uUR0cbykZvAd9wZbLar7iYZLOWKk1yo02lF4W1S8JKji5BRP
	 58utcsEgaOihqMsvCbUxFuKeGNiFl6QpRnLv5ohgULMmcHWrsKO26bf5+EoAJLdkSNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQVXeJRK;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26B6606A31C
	for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 00:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQVXeJRK
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35b2c599f43so500870eec.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2026 17:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793407347; x=1794012147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=;
        b=HQVXeJRKbHbH+PENXZA/vCBb2n2Fj8A8OXTpVl4KqYXjAGH7NmwgR/rs2vLlP5zMeQ
         zTO0FQgL3wsI0+LGyjeTt5wfgmc8U0SYkaZWc61SEYjnOsa6pid4wVYj8VdHTXYR6Eg0
         CqJkMVAPtRb1BThWTwYNdOEiPzd237Oq3ornsmLQWKzXbQ/yEP611wLzZsM1NRAd8oeQ
         UfGuMopjl0SdGxPQjVePmIBXpNgUT2Gl15O566nUHBzGIR84CdJZVCNSwbEBOcBOeX5a
         FZPimCcxZWQ987Tn4L19fBe5mGR0FeJ2dHL6FNkanrfQz70X/0hSLc3c+k6ODU3AMmwg
         L2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407347; x=1794012147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sz2NiJZ3qIKEXA71rCBDrOKHY9+zaIkwX4bCGBQ323U=;
        b=hfs9RJ0FJAXss+xBZ8PH7BJXwEC6liPKntA6nhBIrd0gvfJw4+p2kTJIGPlLlHlrwm
         WR3u/5Dd9603CvaY4gszt5kRdVH1Axf5pL/LgfYqanrqB6Em9GOVPr9GMprSqTz+r6RS
         3zmz0uqeHDJ5sBfNG8BV+OU3FMgUDLToPW4jZYYH17TsYVJrXT6ErR6GiXDaMl7DEJSh
         Q1Xhq/vsq8/tpI8vX6shrG8DG7BBD2h7niWf8KU6FH5xFEmDK+QhCIYaELnc1ZzrxELm
         F/FFCWmtxZG/1gLlvQJ3jY0PXBqxuHWNfLZKSZW+Znz+17ZPYttKr4m605EZZoewgQ+C
         goOA==
X-Forwarded-Encrypted: i=1; AKwUvBxstSCLpaMqP/QiD5aDKZducQ5+snBFLKthk0F7dNsatE/+rH32C4EpoD/WL9afbbbbSZCOhb77mEvJiBJtPC7XSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFsv/69dJNuKwjA66gzCJ2yVlWWmVphFsPXv4wGSBBYheU/AXq
	pyroo3x9PUEsZMYxGKOdMfig7Ol+Dfxn+VasgECyYV4si5KYYDpdbW/C
X-Gm-Gg: AYBFou2knepCcwiVVLFEnF1uUuobzlfcGaLNOrs9POvjMpuHgmNTxtHeQ7W3fPh9XWy
	5PVhdbNAPTLk6Zy529vT5NOHPp+4wPuvAl0kNjKyHDVh/z9xZ+vDA/mmOi2C7Yi5YM12J2QwJIY
	iZSr95M31G2po6e3xQCIZbQB7GxZkk0OPannJaugvQ2PPkzDM9g4FPH7if+jzKiaLS1PgcCG91M
	5w+n7uwFqZDNduOAJSZd8j8euNcZVRBZvJt6fnplUdGu+VPO+FwMKogpRUWLCqlNFHYa+TGV2Cb
	S2vUEIJbl1+pSwIAmtmFxl/LqYynd5shQUEVKXxEFDwF6rZXNQvMxEGpXq7F83lLb64v8YG0rmi
	Kkac2caXuZLI36TYAMnP8Lvp6Amjf4jgtIUEYKsSBf9QOTL5fEhbLznjwmaiGCkxhfLqS7K2iVc
	ymC4PKLlvMmidmIbgraJd9R68P/WDtCN6SIy+1Mk0++tq64iKbH26F5RKgmoqlCmb5MYFE0xoKd
	Y/cTBnS+o8gg3cUxSyKq6P39L5UIsd691vGctZ4SBpttjvr9VsLpzh//Joj0bN3kROz21L3Uq0b
	uOUVM30bS5Fb3F4o6vaEjbdLU38QbIbeWse5wvtJwknRTHofU7BeJC9Hc4GutLsIOlzturKZh/N
	rJRz4IiUF/1jUdZJYDzY+9HbynUYhCqyGcYkTtginy/lPwdSAxiffIAiS5HlbzRQe0UtF1ju4VZ
	pPYNkwqFhfYWN93bksbmqOh1lHjRyZJu9dTL1T
X-Received: by 2002:a05:693c:65d1:b0:36a:3407:26ed with SMTP id 5a478bee46e88-36a4243cd68mr5338049eec.34.1793407346852;
        Fri, 30 Oct 2026 17:42:26 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm10889097eec.8.2026.10.30.17.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:42:26 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH 1/2] tty: serial: samsung: pause the RX DMA channel in stop_rx
Date: Sat, 31 Oct 2026 00:42:16 +0000
Message-Id: <20261031004217.3340610-2-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031004217.3340610-1-samarth.colleges@gmail.com>
References: <20261031004217.3340610-1-samarth.colleges@gmail.com>
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

In s3c24xx_serial_stop_rx(), the driver pauses dma->tx_chan before
reading the residue of the RX transfer on dma->rx_chan to determine how
many bytes have been received. Since pausing the TX channel does not
stop RX DMA, additional bytes may arrive before the RX channel is
terminated, causing them to be omitted from the data passed to the tty.
This also unnecessarily pauses an active TX transfer, which the driver
does not subsequently resume.

Pause the RX channel instead, following the existing handling in
s3c24xx_serial_rx_chars_dma() on the RX timeout path.

Fixes: b543c301c2c5 ("serial: samsung: add DMA support for RX")
Link: https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 4eeef149b..2f6c69bec 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -553,7 +553,7 @@ static void s3c24xx_serial_stop_rx(struct uart_port *port)
 		ourport->rx_enabled = 0;
 	}
 	if (dma && dma->rx_chan) {
-		dmaengine_pause(dma->tx_chan);
+		dmaengine_pause(dma->rx_chan);
 		dma_status = dmaengine_tx_status(dma->rx_chan,
 				dma->rx_cookie, &state);
 		if (dma_status == DMA_IN_PROGRESS ||
-- 
2.34.1

