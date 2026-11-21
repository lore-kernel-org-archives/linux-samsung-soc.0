Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288930;
	b=p05lJHfvQq4U6pdeLNM6l7rq2vdaJf+GMOuQn20EtgVkfQP/LKOOEWAqQthjcp6Aq1PI
	 y0a2P+DVqG7CTifCA4OKXN+EOsSDi4FuO79lYm8MJmLDeisu/uPACbxAleAPKFqqHTGsZ
	 T9cZPYMPDuH3p2R5tQts7w0Hr0o6X3wQsuobjKuA7Cmnsazzr9pjg+kYj4fkuvy2gAwZR
	 3F8j6kq1pJEmesAHKKh9Y9tFw1F89uherkR5j6xY0A3T03qSLgG4nmSRfpCimJl8Ux0NY
	 dTWbGE+MknV8VEeq56HBR62WOb192kBDfOS5PxblexF5BxKBDPoT/vRRXQIVNj4OtHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=;
	b=2DhFaOSikMUkwUnr4W8pvBU3+DWK9OfGpWJoztVDs7rQ6FQzHB81ED7J4d0JyqIc/Xi/
	 2wObyGEsSDrlCxZL3QbohSyMiNZgNGwewOYn3JEWJONbn6yEj2QwHYoiTatgAnx0ConO8
	 9UxZNS/8AYCoz4Wi3bLXt2+Ap8jcGwfhWAe05iLh4o5+4Dy1AxJ/XNdOL6iZhkjER/KBv
	 i6/I0v3Weq0vSdJT8IeRW1V0a0n1UF5BQn6QNaUBHGJRLo+FbwHVVwocD+WMbWjsl03bl
	 ga3Mf1LvI7QtrBOwiduPWIvqDPmATrxRnaOL50tIEHxJXlQQqMZjiW/Wr20m6ejzDxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFmhlEpj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA1606A333
	for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Nov 2026 19:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFA1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFmhlEpj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so23362785e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Nov 2026 11:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288928; x=1795893728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=;
        b=cFmhlEpjichdD5zcqPxkfjvyzXHT+7r4rHt6uWycqHgYc/JS8IxnzVQJuU9w9gdGrp
         oBI7+8x7xexd946jZ/Y7Br3CnwmBCX+CX4TsSPRaprX/AFDBWNw0dYd46yr+MwIHRQJ7
         Z5R/JwlKSJl6YnWCmQUBp+wW6bwdjdzqbquDeQS9EKHHkTPXPFD6NC4k4lvL3yVmJjjT
         OLCl4OnxfnwiD4T8dcSzuDOebWSVh7/5VQHnZ0X2JWyiZSU88A9vVrBgrrFmuspLXSkh
         BQKTo3bsturdbEg0DlfPez5q6/QBVEt3bwFwaVKm3XUlrzWFlhhniL2hWTtX0nOlKzSq
         JK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288928; x=1795893728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aU0P4VqfqrMe/fjnlmGNnb/Fa/CsutnDC2e4seIbEs=;
        b=SBIeEmz/29uqVsZdcn3NJAPdCuaTTIk9V3qB/DhgW+q+4yfVT5w8MjPQogwIBVzj3P
         aIm7oyMJ9AKMSFtd9q8s9KRvEf3Zypj0psnc7E7itsceiNyww9yDgnFlfmZj6tD8Yey7
         q9Dprc+ga304VNNwcTbXvEKyD/a8oBENSa3BGIEPYYPWy/RAOdfODstP2F7kd0U+Mgyx
         8VYpLhBXfiyxmImdgCv7JvO7SB3rRbBuZyWFdzMFdfUjLaLFI6Zihqf+S4E83Zi+i30X
         e8rts/uB2F/3JsaSuRnYz3QTgl8auG7lW2+ihnH877zwOwzmUTTlpTXGo9l6HK+ZJIOl
         Nn8A==
X-Forwarded-Encrypted: i=1; AL+hErEfsS5lQP9QvaFSBl71Fh1w/awEtITrXGpu/RCzfGhbkpTxvlcfGtrAAmxFYipGglm+cS+mF3IwbmGbHPLYX5jZQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0stRZNP+WqS05QXtXeudUYmb2PcJ6bBiOVT6x6YpUy6316sE3
	JWxz4lLDsuAbixlOsR+Yfa5vsH5YdRny/e6gCMvytoTlZB5/aSwZebfP
X-Gm-Gg: AZFdTZeCKCS+1Sr/zynO8mBYV2FBETMltSSNS2bIYaGrjXJuvdl3wc7jrmqwbhc8xsJ
	QgjjdAAlqxNOC+kVmJQ01QHO90Qu4hIarWyti2TGP3jSP9QtRdtK9lpeChxp0CiWbv/2kr/YTqY
	G1L/1o+9GO4hPM8/qxwCjIvFxccSkpLcy/Wqr5ReJJrNuhoM912oKLf3vJVFOXwEzXIoIAsd2Fj
	zfYy8Ik9Vf3d4N4AiFjfUydwjEVa2zLEL5tMRvA5K01/yG41uL9eWWFtE8vwlcGzwbTZ7qcDnjf
	COvGFKeTdyG69h/Gdvg/5Xfglb1BZgiaBzhgectYdiSto0Sp4VkTn9qVgXM87fBFDV5iou+HKEr
	EteomFuax5IWXIj8KF2P7oNxs1h+z5LXmlqitNzf1Li8JQqX2ZbrhwFbC5R4EbQnca8O+okffoN
	y71XuUkDTMEs0JrOwvEQkysWI9lnPJmulZtfXTIMfHS8VzZgL5+3mM11NitAH0lrtHayD+oyNsG
	72IsA9smjwYPH7ypKfkYaVEnXZDphy/j+dV1RdUGUG8PiP+czxb81XShN+RIE99bhieE7o3C7wt
	wyhs27Hkteoi12f3VJ5S8qiWG5pJb4afN6ytr3C38IR5/oOOKnPOad2v8ZgEKeQYKg==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr160908755e9.0.1795288927966;
        Sat, 21 Nov 2026 11:22:07 -0800 (PST)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm67560085e9.4.2026.11.21.11.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:22:07 -0800 (PST)
From: Bramuel Barack <bramwelbarack89@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bramuel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH] tty: serial: samsung_tty: fix -Wformat-overflow warnings for clk_name
Date: Sat, 21 Nov 2026 22:21:58 +0300
Message-ID: <20261121192158.44872-1-bramwelbarack89@gmail.com>
X-Mailer: git-send-email 2.56.1
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

MAX_CLK_NAME_LENGTH is currently 15, which only leaves room for a
single-digit index after the 13-character "clk_uart_baud" prefix and
terminating NUL byte. Because the clock indices (cnt, clk_num, clk_sel)
are u8 values (0-255), building with W=1 triggers -Werror=format-overflow
warnings at the sprintf() call sites.

Increase MAX_CLK_NAME_LENGTH to 17 to accommodate the full u8 range and
replace the three sprintf() calls with snprintf().

Signed-off-by: Bramuel Barack <bramwelbarack89@gmail.com>
---
 drivers/tty/serial/samsung_tty.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 640f85e2d636..40a21e6825b8 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1336,7 +1336,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
  *
  */
 
-#define MAX_CLK_NAME_LENGTH 15
+#define MAX_CLK_NAME_LENGTH 17
 
 static inline u8 s3c24xx_serial_getsource(struct uart_port *port)
 {
@@ -1386,7 +1386,7 @@ static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *ourport,
 			!(ourport->cfg->clk_sel & (1 << cnt)))
 			continue;
 
-		sprintf(clkname, "clk_uart_baud%d", cnt);
+		snprintf(clkname, sizeof(clkname), "clk_uart_baud%u", cnt);
 		clk = clk_get(ourport->port.dev, clkname);
 		if (IS_ERR(clk))
 			continue;
@@ -1778,7 +1778,7 @@ static int s3c24xx_serial_enable_baudclk(struct s3c24xx_uart_port *ourport)
 		if (!(clk_sel & (1 << clk_num)))
 			continue;
 
-		sprintf(clk_name, "clk_uart_baud%d", clk_num);
+		snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_num);
 		clk = clk_get(dev, clk_name);
 		if (IS_ERR(clk))
 			continue;
@@ -2326,7 +2326,7 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 		/* now calculate the baud rate */
 
 		clk_sel = s3c24xx_serial_getsource(port);
-		sprintf(clk_name, "clk_uart_baud%d", clk_sel);
+		snprintf(clk_name, sizeof(clk_name), "clk_uart_baud%u", clk_sel);
 
 		clk = clk_get(port->dev, clk_name);
 		if (!IS_ERR(clk))
-- 
2.56.1

