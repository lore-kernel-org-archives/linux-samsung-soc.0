Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA65339872
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435229; cv=none; b=R4c+lXYlD+aBKPNkFBxbHN32Hsg7oBrmLbP+wrp+SfTfTo5Tr6lk2POcMxXCEVGEPRKtHUSbUT1QZ8yaxbGmLfjfMApBu0x051RB1cjVmVPKmVixLJZzCf9QrbYuIxKaievxsy0Ir9u6q1MbP7AiJ5dVxCVRZmovfRMyCpB5vOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435229; c=relaxed/simple;
	bh=WGU7/JMb3Apf6nVCL6jDk8mWhlmHbK7srTQ8Ag0GJPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qz4/j/2y2SloyHb+tebkDrwHePOa7wEibpPSJnE3u6MdkfnAjSuL+2pV0xyzNg7s00gTIIhUk3iDhgvQPNZErUlk3b1PcsrzCu4bm2gu68iTg4yEA0E+MVpKl2pVptYxe27RNGsij2ru6rnrVZcmvwNlKz6WFIlWg6RVn7q+Npk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q70+f9D3; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q70+f9D3"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db0aso34581206d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 18:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435224; x=1790040024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bAgcAeT8h1GjhtSyhK4NU9n9kJiBEpb3mWf8LmEtbk=;
        b=q70+f9D378mv0oplvqwtYnLQOz8q+f+4PZRI8RtM9qSddiKKJ4NtBp57We2lrDKeT6
         uylKOERaUVqc6HXJ1gdW5p4M40gwNIdyVOxpHh1g/8ypWETO5NL07Vis6ln4c7knVlnp
         4JuOlRmTul13brTbmegxC6TgOb/lpnchrjvSE06CZ+zvtO2Q+r1uH9kCOHiIm1+bBx6r
         wBCJVXmg0l9DmPzCCeX724F0A8qk0Dam7HHYAKk+CXTl9Sq5rDco6UT/dXfbhVBAUFBP
         3AEjpgtYp/FBx/4HUty+DRaI8Lvuv4RWvfcYUdliOzzQkZWxua6Yy9Gas0i+GO9eCiav
         AOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435224; x=1790040024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bAgcAeT8h1GjhtSyhK4NU9n9kJiBEpb3mWf8LmEtbk=;
        b=SmXn4WivmFNloDGyvKZr+/iIB3oIk5+f5UDT5Xofz4crWt7dXg5ma2TEl/9zIV9uTk
         /UMV3TBDrolVCfaKJEmOb85c8EHabSJ+D5vvUpu0UamDaWzuaXbyPibCqJIzL+FQq8Ok
         c7VOFkKI0f00Hu3aYHOv1135S/bMY/vc0pC/MXfHSnlbpSxjJcNxcpY79XOm/lJDk9xy
         Wz/RR+kyuQ0dvqL1Wy4MdiSXlD9JLzBuPFsVOWIAHdCCq6tHB/twUIC8cr+UynN5mEas
         mk5RxjN7jQwCXj2snS1A/WqOkrMGsjZ5DtlDX3NomAOHTbhi1avG3OZPGuVhLAa0q8eO
         N/ig==
X-Forwarded-Encrypted: i=1; AKwUvBzkGu7cc+ATHf4Ytnp3n1ZX38NaNXt/btPNj8yKPPFMeg2P74DhGLTvFclXJjgZdEz//+e1Bbzq8iUzxi07+lWF8Q==@vger.kernel.org
X-Gm-Message-State: AFuF++l1saQHh1sMoXvqjd7vzkeIGwNrMpj7sbC0l0SmaNQfCdYMnZAa
	YjjVD4XetEs5laDOZtir38vcVwIIVYvRKnyHLoQkIwfdQb7LLKFYVeE=
X-Gm-Gg: AYBFou2oZe0ZK5w6W4mhzt9EuIlkWqDTHSC54Q5tD+dGj03eIa0MXz36+o6qPVvHxs8
	6guctzZmCKp9/yZ9vbbFSMd2OilimmommFwvg9uVs/4irtnILkjCERmbdI1yAsWup2c7f0LMlD/
	21QjQj10bDEIemalB+nqjgOvIwmKYBsdNwKdQC2Fsj4meVOubIHWP6LaQlpJl5+PR4PGOb8ViK3
	TPpKBbztt4HmeVBm1DuxTyblH1Zo2S0/zDktaZdKEYuXbK3nASS4cQa297aSzx5ZzF6YI+ege8y
	5qAs0MB2DW+cx/V+XemOFR1h6V8DxqvEEdtdfeB4hsWEOIiJMPlO9PdeSU0cSFT7OpRSdyTeXWS
	lcK/LhhLigFdeJxYLZ/QR7heOLHAaz9T4XZWTS3DPiJ/4zFtM9bnIM3FIRY6FOhStKmH1h2Y97Z
	+DyGyd2mmwe4PlgA4nvzO7Nj4J1O2ysK3f3yjOXlvh+wrxYDBkF/bPevDnuxXGJazwN6uumuNk4
	u3fHrjvtGREgU7JzFESDgQKScRqU3Nb+NpeAQ8VTFKLHDKXiDvpAG6vjA2e2/qobFh5SY6W67cO
	61S5lAtx0+Hoz/69Qcguc8MtFvQK1a4kOr+2NX9wYsAacbOZxdmkDEoJKdweEvGPjrM2ggOAmUN
	hZI9DJQ==
X-Received: by 2002:a05:6214:2f0a:b0:910:3453:9011 with SMTP id 6a1803df08f44-9122e66e23bmr95006006d6.35.1789435224176;
        Mon, 14 Sep 2026 18:20:24 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:23 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/4] usb: ohci-s3c2410: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:09 -0400
Message-ID: <20260915012011.61874-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-s3c2410.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -335,6 +335,7 @@
 	struct usb_hcd *hcd = platform_get_drvdata(dev);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	s3c2410_stop_hc(dev);
 	usb_put_hcd(hcd);
 }
