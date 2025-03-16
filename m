Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8799C634EC
	for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2025 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742136149; cv=none; b=XKEaRQ8BQ4gcmLuCx9+mcE/fmBVvjOgnzRsnT8l26YEOoxj5Lk2nd2KMIyaK7fwCyJgdzFXU0GMkgKPspoFcKFQ93jFjv2FpbOO09RVw/UOZuOf+v6kRVUQQcfnHiSwdgo0uzGOy/cCzjKLPPu2xnwMM3xNQ+GOQqINFum2IBR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742136149; c=relaxed/simple;
	bh=hAwIMSzK0uCAG8yRC35L5MzxIb1ccJ6Q76LufHUuaYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jwrhunNQ13p74qncmGpVrqpAk9AlMv5QS52hX6iQgMaBdO/+au/d1/3QEkI6+eJBkRCPcbC9Z/Nl7rRGe92ZYxLwTtctZydEyG1fgx5ejQLfexS5wVvfvYtvtxPoy53dJeXaWRKOCt9Ih15yKU65Rx/1TknG9ewd7jE5WPl2jW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5f/EQsC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5f/EQsC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38da6a1a20bso429252f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2025 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742136145; x=1742740945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJriuSV/8IJe5ycqkpE6UDdCuNRLNCnL4O9Y8I+CLA4=;
        b=o5f/EQsCZuXcg2UKvx5lg+oPQymIxEVmp7m/tHABF2UzG5OW/Y6+K8YSMlduQL7mKE
         nWrykhyzkQ11j0xw8IqNQHXvLXK5qYTUwsTsz6Ia15qwbo3qXGn6z4h1vOZeQlYfGVtq
         qREmEUy33oeUW4IjAmHoOt1npnEwlihXM0YE+b1PtrNq0oGplkCTlgBhDr4uM19CHkVZ
         WX8WsHu1kUnTlayxXymxIC7WXCIPuudRuVOLSSP3a25rE7M91DIJ3lj1IYoRPun2No3d
         zZAHzeD/9lojSXGfUU3O4OHZVassLvrHHNy+xsVtiDstrtVFbg851kou6Chm5RjaC7tF
         zaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742136145; x=1742740945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJriuSV/8IJe5ycqkpE6UDdCuNRLNCnL4O9Y8I+CLA4=;
        b=gZFxXMLZaN7zQ4QUFgaW4+23IVEgJCCBWpY5pA94mcdYI7QDZvtdhXy3OVN55eiCyS
         mePfauzxs69SZTFBhizQa2mdsvafwxEs6AwwEfb5lQLGcCMXH8OI+i+WrAxt9Y1LC4BH
         9uQ6+W7g1r0s4Z/kdvi33uwZkOFS58N6BdtsvFxt/eFPhWwnDzqpsVRvb46rdodbZlRF
         h5/tBk14Kv6JnOgWxn0AfNAnfwkX0ETZzj1WdoFt+wXxBCsliJp+vffS3/R+hCT4i5mk
         IwPpebp+sCHYehKvYrJH5Iscu3sm21K4aptPxfmy1rfBizx1bCAdx0agYpfCAZCJrkzk
         Uxlw==
X-Forwarded-Encrypted: i=1; AJvYcCVjh2V2k0kDAKeIofbbl0vxC3rnhJmgzzlh3kqp5/wPJClo1P3IHUFQjLRm4Q8ovbEJXYzBvBuHMSAoTggArA6/QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKH6+hlVS4KUI+3TyTs5pPlQES495lYaIWG2FQed4PrGreMzoI
	WAEyMoXHykIcAuwGYMAQOWnw7Xsi4Ony+/tQoDhEAFYikOZKpdhuq4SVFD07TBs=
X-Gm-Gg: ASbGncsznTREpv0e4huAeHWD1A7cMdwSKV/6g/EDwyEZSVOWZO8iPi4/kXBeQMI74aw
	4Ugq8xjFszO7qC3Aw1r4rVkRHTGgARnzLJGDXWoCe7+hJ9DM3I+YDhLASEv/gfz0V2w8g6Cq01o
	eHcdondbvxGTl1xH56IkGI64O81o8u6VKuP6pgyZhgmL7mw1+wjHH1ILICs2XMBZ1Z57X/1aFDc
	sXcCALL4pwExoEV6bTGRhGwquSFXilgbfPjjaiDQZhJDiZCLwn+HXoCKXcZyYKUd4vTljdumkTy
	ScdQQfIUm/BBwm3IFGev7QDcdJQr2D2Utj96ws+2jM2HYt7CW/9lFbQ0tsj6twf5rJn/
X-Google-Smtp-Source: AGHT+IFN+HWoJ/RvheSs9Qe6ufnnQM/Id6b6C6RXmbLnvuIy+0v8jxxH3K/QTk+P9kPHsJxT6hIFLw==
X-Received: by 2002:a05:600c:4e8e:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-43d1ecca06cmr40418265e9.3.1742136144846;
        Sun, 16 Mar 2025 07:42:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb62d7sm79591825e9.6.2025.03.16.07.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 07:42:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] dts: cleanups for v6.15
Date: Sun, 16 Mar 2025 15:42:20 +0100
Message-ID: <20250316144221.18240-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

One ARM and one Loongson cleanup. I gave half a year for Loongson to explain
the spidev, but no responses were posted, so I just applied the patch:
https://lore.kernel.org/all/20240717-preacher-sandal-2aeffa322b9f@spud/

Best regards,
Krzysztof


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.15

for you to fetch changes up to 854a080f0b73ff966a813ec2dc53891831daa28d:

  loongarch: dts: remove non-existent DAC from 2k1000-ref (2025-02-12 21:48:51 +0100)

----------------------------------------------------------------
Minor improvements inDTS for v6.15

1. ARM Cirrus EP7211: Align GPIO node name to match what bindings
   expect.

2. Loongson 2K1000: Drop incorrect spidev description, by pretending to
   have there something else.  This will have impact on the users of
   DTS, because spidev will stop working, however no counter-proposals
   of fixing this or even explaining this were proposed for half a year
   after the patch was posted.  Therefore drop incorrect hardware
   description, hoping affected users will come if proper one, if needed.

----------------------------------------------------------------
Conor Dooley (1):
      loongarch: dts: remove non-existent DAC from 2k1000-ref

Krzysztof Kozlowski (1):
      ARM: dts: cirrus: ep7211: Align GPIO hog name with bindings

 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts     | 2 +-
 arch/loongarch/boot/dts/loongson-2k1000-ref.dts | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)
