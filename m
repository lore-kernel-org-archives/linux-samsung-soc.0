Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504F3368B8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 01:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435229; cv=none; b=A/Qg3jwi5EHngbbUUVKYJn9lPDxeBKp9DvZqOuC5lPaoz/u0uP5YmFC2dL7RmRcWf0dBXIlcDWrBefbWh6PSW4v/h8gMGi0zxkFU8WtAXHJghQw78OL+BQ+ZjTg7TLP7cdDWQmOkMLRhfVbYi1zBygSE+N9Ve2Ft4YTM/YvO3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435229; c=relaxed/simple;
	bh=CKKoXinNIPjaJ7mWM3TvEUEq1iXPeisQkm64XntF2Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DIUI/ZeH/DJWxN6Mc7U6GyqN2+eRpnWDqa6/9/WwKwCtoLAMkZCLFhdaD8MaB5TE1Q6NvXiJVp2V0vGnO+dQJQhQZKbg23M0Mh5yGOYylBYczv6mFQppAUyzDvdLEPceTyz/UGq5LphSDqdtxhwUYEV9GRyM8m7LK0hzrXzuO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKDH2hy8; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKDH2hy8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91235f46716so1681286d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 18:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435227; x=1790040027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=;
        b=bKDH2hy88roSbWAbthQ36jUz4Y0jCVs7cNPSiqCFShYtQL8PzkxO57EEh8OwbrsGKE
         PI7upf2d0tAOHKSJ+BdD9TyT+3WcRz0WbvMwU//wMxAio4P8Xu8BHgcygCDIleLUb7qZ
         1knmaDQgS6L7eyyrVVtREKUkjE86DxvfVSkaoWXj7qU3lOICKNWCdzPxgcMqbaDXjdY2
         Cr99vKTnZzDoBgsK6bKramFb0uWCejvg2jzgmcu7GFtJHfMyeBc7xDbF7nZcDyF/s8UX
         N2UEly39mJdi2C51kkSW3ra9lb3QzvYV5BLjXKt/2hcNhEuayC/GA5MyhyiRtrFTEaUZ
         J4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435227; x=1790040027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=;
        b=iBSBJzuVO8tKIlHrccaIwNK4AsDziDdb1rnt59PdFU+QoVgzUFtQ8ZOkGvEZR0l94C
         TuP9RmW2dDBmiXryEKHcBoVNF3rJGrN2EhWs/6XZqJjWVqd6ohVkXiWDkRsATICjR6Lx
         gbmSwep9FLJEG0BoVRZkyST4E/ULStKr0H7Bj5mdt5jJDZfZq1sOPgqDk71cMEJo/6sp
         aKj80tHI1HZvC1zErqNpjeR5tbX0X+ukoeBE1DpGyTr3hTeUWRrD67d8mlUh9STjUwaG
         On87BwMpLqaRZjSPCHH+dAWZXtPSRK+YImpRyjYvpjja4ugLdUOvYBBPMCUgUWxXKhfd
         TvkA==
X-Forwarded-Encrypted: i=1; AKwUvByKbhF19+j2/+6+Q8SrwdaUkbAeuh1iG7K+P46Acq0KVhA/KXIJ20tI2ZHGS8utAE+JdyttsWI8KgNf2ZHK/ouuFw==@vger.kernel.org
X-Gm-Message-State: AFuF++kHWcs79a/RHGRj/Bw37tVGgXq4PUXSqIuGzp54qSMmrGOYM0H8
	yWe4luqM8zUjYWGG42utbv5M1mE/07vFmc0eH2niqXfUNZfUBcrK7F0=
X-Gm-Gg: AYBFou07gZ+sQXbeNrV+hLpH/byyuu4MM54ITgEZcFuk0SK9xkwcNdBwMcXk8Fe1saR
	/h7YaslixR3wdkJqlUQRsvoMn+Uu79aJHRjUwpxxoG6xNEcBMWj18i7BVQ8QgS++iky3YVPbjgG
	rYFMGn9JRlkrVH2+9tlnLDb5CY1mgI7SvFIBjUlINHc7PoVZdkevISrNYQqYgQlq09lAvXjJ70v
	B+vbotQAAV0rPIWWXigGJkMYj8+B00FlPTgZOK6q8zj5GprBZBRPand3RyiytnJ52/L6fVLa6o4
	vdVWcMfHWo4vinVF+UBh1o/ZWS9SPboZui/LaN4fWbwRxqdMeDwLV1TNQcDu54sbhC7NmOAMikv
	syJUFH7U/VLVaTz0znjMLQUdqq2yWclXIP3fyZOTpHZEvmYgD6qPFiBhBOpc3nTtxEugTXc6hsn
	d8IgU6yoafV8MizrtzWWvtxXltqtU4jinBx6RV/4Wu952dS8Yt1znK/NaN7UKukh3wh2kvguLwM
	WwWllEuqdhMqX0GDVyWnXRi1GHf6hqdHYhsDj0/WZqC2PPSjPv3YHfHb2OEl1n0iNy8MSQ8BVBG
	kmIveIDaSTCVukRw5WsuHfegxysytkw6KtD/RNog6kbjBxDhyENfeb9UX7DAFg253sAtxRYlbuv
	I5QfI5A==
X-Received: by 2002:a05:6214:590c:b0:8f0:3b98:d6af with SMTP id 6a1803df08f44-9122e660530mr96067806d6.26.1789435222335;
        Mon, 14 Sep 2026 18:20:22 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:20 -0700 (PDT)
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
Subject: [PATCH 1/4] usb: ohci-da8xx: disable controller wakeup on cleanup
Date: Mon, 14 Sep 2026 21:20:08 -0400
Message-ID: <20260915012011.61874-2-mhun512@gmail.com>
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

The OHCI core marks controllers with RemoteWakeupConnected as
wakeup-capable. Probe enables wakeup, but neither removal nor a later
notifier registration failure disables it, leaving the wakeup source
attached.

Disable controller wakeup after removing the HCD on both paths.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-da8xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -447,6 +447,7 @@
 
 err_remove_hcd:
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 err:
 	usb_put_hcd(hcd);
 	return error;
@@ -457,5 +458,6 @@
 	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	usb_put_hcd(hcd);
 }
