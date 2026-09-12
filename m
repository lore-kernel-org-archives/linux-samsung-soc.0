Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010EC49252E
	for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 19:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240402; cv=none; b=KTVYKl4cv/WZ0GceM6lLPxx0F/DY8OS5U0gbgQksg33n4I8PP6X+6LixlmRfsgIVnGLPF1IjXnYyQ/BNH6K0YV+PpNDU01kGjtVFOqCHc0zvdw3zknEY5eVRXhe4r7PEcGzmnM4SvTpczzb120ltCiGGsrA51+RvJ+k7kJ4sdjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240402; c=relaxed/simple;
	bh=rzU25QtfHWStXyf5JOAOYagDMlPR8E/O7UUr9Hj10z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOX3vDTrWaahHkz/qGEFgpff8Tb2W02MF/enyX6LMY7fF6rYQBIT8EuOEQOmIE6dc4KEcpDhKT4jH7lg3jGv0BxwqSobpatEPpQfCp11NbAnygAi+o9oFHBTqINg7TCrWcKHWcBL2Jx7uqOXMngEoGG71xUVv/V/k178TfvjVJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3gOWOis; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3gOWOis"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1473465a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Sep 2026 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240400; x=1789845200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=;
        b=a3gOWOisn5B5hRqXKFFZKdetKy+GtbuubsLGdKfo8dqVPZnDjUVVyhiVI9XUkx9E4X
         TMjXM4UvHdST9h6udvx5ez24iQKYZ2V7W3zX1Z0yh5dQCXfeX3zqcpE2VLPlOgcvDKPB
         paiBP6rpMsArRYh1Y3t/GG1OsXYDzEAPgP1HyakdZ1/FjORGhtUuAlf/QPT7c7QhZIpx
         lzRNGFdtG6uhd9cpzXIXhVGYxs5Kn7OxElWIVaR25MN0adsA2AhHHg7oF0GD8OthXboy
         aTUKZPWGTWoXVFr1+pU2wPMwfIAj8HJQ0Xan/coljkOmX3aPp+PI5OyofQSVcbAEQ8hK
         M3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240400; x=1789845200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epJRaVobxvGM+/1VLnT5WJdru54OJK34KQRZKM0LI5E=;
        b=H4yCM2+Cfdsku/m0UGzz4qjGrBOmuG0EjFwPBHun8v6ZjSLJkwLEZCfxB7uadvgi+8
         QLmigneGUKqno16FJ9+vyOaQhzWgXOhp2N9b8gF1oNfc92wk9gLElYb1C4G28g78+EO8
         8JdSyl1hvOnU89MyVrLrsqM4WpN6LN3/iMhlq/wWu0ohzFnniAv0usSd38SrfDx0CCHm
         XDPvy3QREVE5Q02N0GIOL/sr3U4VOAWSR9FEBE4UiqC4Hytcjo6rInw+Mii0bEw0Iz1B
         7g+5ojDRg84wv8GDArrgu/IkqEpBJSLUHLGLZU1hRQrRqeiw0R9EGQ4UaqLkbdAr9l4A
         DyWA==
X-Forwarded-Encrypted: i=1; AKwUvBxFHeIW12OyKQRbhLEH4Vm2xUmI/+qvUZzhxaIUdDnWagK/ACDApnbkfyxGW/vDE6Sos3Zes9TllRU03YeMUqJMdg==@vger.kernel.org
X-Gm-Message-State: AFuF++notog2DIMv6a5V/PZC1Z/Uu0QFb+f9Vrq2CSPKe3Q8vXG72Sue
	POFFmkonFvpXasGCnX+7xyuWzCnUVxepUs3ni6GNggWbfUZm76dCpS5r
X-Gm-Gg: AYBFou3tnD8b1KUzVgU8QcHOGwNTmpE80Rn4ADF0MyYn6fJuM2xTGEpO+cNpH3BkKdn
	EZE7zKZ6kphFuOy3gSCSbw+8synnxN66H3vHIZV6OM7UDXKsePdjacrBPWhV2QJutqIWBZSsj2b
	CCrKcEVJA5NjdYgh683cWr8XMA+/5AhvJbDezna3+vL4nTvMoz/btCO+HiSRby6p0ii7eLkVexD
	0i/1dUJQ9SeGMdZHSxIBanLIUYL1WbFJn7Qt/WAkF4MKYBS3R5sIJ+a9P0XdieVg9JacuTMgAcm
	ALOxvck0hWdb0zeSMQ0+6liQist4QWYKOI8VLcIEeSWViqPRWCoaTIboJyzvDH1uGwa6MItZgDY
	Nu4XyIKYlY888ELYoKh8vvwfpw1XcFjicRwtKxRXle/gqVbroUcnOl8A8JcOjbXsUJzYRKoT2sT
	IxZDFZb8M1PjMBUvhYA4VHiRxF1bnOiBgruALtOCzyJgprPxBlEs49RSv3Ax1giVn8Nt/f
X-Received: by 2002:a17:90b:4cce:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39d9bec4d91mr17930859a91.10.1789240400257;
        Sat, 12 Sep 2026 12:13:20 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:19 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 5/5] powercap: intel_rapl: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:55 +0530
Message-ID: <20260912191156.185448-6-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_debug(). The %pe format specifier prints a symbolic error name
(e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls
back gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/powercap/intel_rapl_msr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_rapl_msr.c
index a34543e66446..46972ee1ff84 100644
--- a/drivers/powercap/intel_rapl_msr.c
+++ b/drivers/powercap/intel_rapl_msr.c
@@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
 	rapl_msr_platdev = platform_device_register_data(NULL, "intel_rapl_msr", 0, def,
 							 sizeof(*def));
 	if (IS_ERR(rapl_msr_platdev))
-		pr_debug("intel_rapl_msr device register failed, ret:%ld\n",
-			 PTR_ERR(rapl_msr_platdev));
+		pr_debug("intel_rapl_msr device register failed, ret:%pe\n",
+			 rapl_msr_platdev);
 
 	return 0;
 }
-- 
2.43.0

