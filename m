Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA6A48A2C7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405129; cv=none; b=sij/RYx6/KZMgJGmXFPR3qIUBVAxV9IqeV3WqkM8OFw3yVsgN9T1EjM9DPFiJOvzUkM5XssJURWfYAbkk7SO98UOPvTSkRUOu4vRBQQc7r4lNTCobbM5N3GjZUfoFt0gZKDL5eZVepjtyky68lLn8w9cGy/ytFQlgQ2sW6P+ezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405129; c=relaxed/simple;
	bh=/pSpjJCf37a/GQTEC5bLaMzjYEnXYF8Wkh/lA6snC/g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kMstEcIhADoCftV0+6LTw/hE/VUMZAGHpmG7v5/lQjteS87IFZqxsYfHPZgoP59F9mWyuu0+bTqT1onz7Crmkuv8JIZzZb/8UsLNxjHFdhEvbJFKwtl3mgdKwtYj2n0H5HcAI+cZAMBBSPaav7S8+pAyytC/PhQPXvet9o2Qmm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RPYEUzTx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RPYEUzTx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1010283f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405126; x=1790009926; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rVlDR9iO9xzNSL/ayRFSNBQcAYg5eJCcJuC+js2w0wM=;
        b=RPYEUzTxoc9BlPgGesmFzAfdR5OfmU7eWBbw0ZsYTAIZNYSPU2B7SXxVGpyrRq+VhH
         /9SoO2XQ1tslzBKcatGZqQD5sAUqwm0dOnDzSO36O3bCdv8NgGNfTV/TX5l7GsdrT53a
         0zPTwiDpOXqa6UyjRkqeC59awg0AkaP+mX69Drpy9vChzIBCSXg6HhmomLEI75GHwe7/
         mlw7swvSA3yHHWiMrfNbk+8ceD0XfIvM/fR2vcswzS9rTqGG1ths+F9Hn/Bi+dbRdMdw
         RxsaRzfAwReJ1hZ1rmRZtjAwFqXiW13RLVXIfxZhCMnwan5IMpQ2r1uoJC3GPM7naykj
         nbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405126; x=1790009926;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rVlDR9iO9xzNSL/ayRFSNBQcAYg5eJCcJuC+js2w0wM=;
        b=CvSMXFhpOrGl+CIJxJYnr9z0q/wK6vbICUU53aGvm75C32m1Mp5mmfQN1Mq8xprUnF
         Tw8z7xxTTqKM7+iuic53CfnMov5nxGEq7pTunhcrN361hC6iv/yaOuvXso4UDTyNhFay
         uom7zXvieeAKVjclQZ6EzGq8gs/JjQh2ALQMb/GCIZJ2AHR6iBauEdPv0Hfcb270Cnkg
         QJG4PoC4JMtb0TfeWVOMVzhZmXXj4MrjpY+/VIN8Vn12y6NFL5pdHKfB/+GdA7F4gEI2
         qe40VEqDERtzDnKZjq4bFtprcsnhd8eTNs8eQOhIMN3O7IahWBp6eZW05w5W6ui3tItB
         b2bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs53lBRHxy6i4KOtPT9eMNkhWVFD9Lrhi+NYK5mMhUbddN1BcmFsORYD+w6gw2W1OxXVFuSjlO84lweZB2/g3afQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mQpZJfCR5OGzT+Nqrng8qWoOhwoDXXE98hZdheFwMEXezM/O24
	8CzcFiVbT5uciNRcGBQuWA0h5NUtw4TgRHB9j89fIb6TtCr/ViIe6ne64UNFkZ6cgaQ=
X-Gm-Gg: AYBFou3qKchRkpGY2ltGWEUIcP819hVkaBNNZrP/TtLaOLsVC+dTijYat3u4kmaqnxI
	xnr7xBLz0K+oqnkoWAKxdga95JDu75QDBb8Xq7MuKbrKbIkpz6Ii4l+Ca0AwtYk9KrWLLHKRMOq
	NOz0f+xmVmqp1E7qAqP9cwv0p28sfJn8kvSaaMIxwzxzV9YPo98dilYItYxHUXTaXF/qLkhVIYy
	J6j+vjjRpBWQS6mj6xnM2RoGDLdfP1XmLBpmt4K2nJmxcQRTx0w0HnupCsUqVaSVSlZ1uW+1sxY
	TcQ//lvjAOdkTiLkFx8threosTOk0NVoECJRsgq6ovjXR+JP1FT8xhvjtmWt4o99pi03sCKfp+I
	RFUwFo8McEK6BwNSdY0Btxi/k1UeZaqH8J/yfuoeWuyflqeeVpiNjk9R74iohR/SpPVHKtXoMjn
	bHoXyLkcSi+GxjiXd2cPyGmAgN/JLPx4TxCxHe/2djEGNcCm3fxOL2PLACo93mbeR/b1E7hkn+B
	4qXEuSf526itBHErJKr+b+r10uIivcFOI0hNLbQeeRhDM+f9CsrlXq2IkvSc44=
X-Received: by 2002:a05:6000:25f4:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48702b5b1efmr4480960f8f.41.1789405125646;
        Mon, 14 Sep 2026 09:58:45 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:45 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v4 0/2] Exynos850 ACPM SRAM devicetree node
Date: Mon, 14 Sep 2026 17:58:43 +0100
Message-Id: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMnqGoC/3XM0QqCMBiG4VuRHbfYfqfbOuo+ImLqrw5qiy1EE
 e+96UmFdPh98LwziRgsRnLKZhJwsNF6l4Y4ZKTujeuQ2iZtAgxKJnhOcZycj6pgtxjMg9aGA2O
 V1qiAJPQM2NpxC16uafc2vnyYtv7A1/dvauCUU9k2pqhkW8lGnO/WmeCPPnRkbQ3w8RL2Hiijt
 Ra6VFhAK2Dn828vdz5PXpUgjdBcKax//LIsb910RkwtAQAA
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Hi all,

this is a small series that adds sram node required for ACPM communication.
Bindings update adds new compatible "samsung,exynos850-acpm-sram" there and
excludes it from having child nodes and not required properties.
The node becomes a simple one:

apm_sram: sram@2039000 {
	compatible = "samsung,exynos850-acpm-sram";
	reg = <0x2039000 0x40000>;
}

The ACPM driver will just continue to parse shmem phandle, so
as far as I can see no updates there are required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v4:
- extended/added a bit more explanation in the commit message of patch 1/2
  as Sam suggested;
- fixed size of sram apm node (thanks to Sam for noticing!);
- Link to v3: https://lore.kernel.org/r/20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org

Changes in v3:
- sram node moved to the beginning of SoC section in DT change,
  reg property updated to match section requirement address-cells=1;
- updated trailers;
- Link to v2: https://lore.kernel.org/r/20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org

Changes in v2:
- small update of the initial commit message
  "Add SRAM node" -> "Add acpm SRAM node"
- new commit, updates dt bindings to exclude sram node to have child nodes
  and related properties, this adds new compatible
  samsung,exynos850-acpm-sram
- Link to v1: https://lore.kernel.org/r/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org

---
Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      arm64: dts: exynos850: Add acpm SRAM node

 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
 2 files changed, 7 insertions(+)
---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

