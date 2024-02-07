Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F76580BE8
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707320315; cv=none; b=FsntZA2lXrPwFxQis2lgCVOvOKg23o/PNsiH7WwtkWaSkJ5G174+jxvr/0vszYA+liwhZMDKj4502jilyktUw4cp6KpfHYeQqaq9oDL0PQt0eNZKu1SvkBhexsovi9xrRXM29pSzyycP9e+NDzfB3mCKgFSsOtnUgkzzHoRmfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707320315; c=relaxed/simple;
	bh=oFGTh2OhIvPbiv0dHz2+sLUdT0AGdS+r+fNSNWcO/FA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pySDo/KdWcozWfPaq2aSjp1OcXZvEUjtATcEGFpD+Du1gnazzsSUmXA15cvB0IvsFaYPijJC/yZhjFXdydz+4lwpdmotVxsXKM2NE8LH9qdneqSaEFZT3L+EYonBsGqLpomTcSv8I9u5U8kzXCDJKr1YRNY0muaPMUGSABuj4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sIKzYJDv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sIKzYJDv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4101eb5a115so3477115e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 07:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707320311; x=1707925111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbvJWnlre9MH2EiIqsIcJXmUPZrjG2BFAN9G+36KKP0=;
        b=sIKzYJDvJiOKRktNfD+DW6VYZo1ONAQDl6JFUZYQiDqgZhxxUO/iF7okwYdwEFai15
         EMN6EKIf5E6xf2qWRrdeIamfD0VLItC25dCbahqqxmHo1kUDlqZqOGn+ljqdwMqVz1zb
         l+yNRrcCf67V3vGr/lsJ+tYSv0zdiW/IzmHod6PhFPlQuEYjBHtWGZbBXJxEIN97t8W8
         eKKXhm3QoYhdov/JC+RNY8I24cAq11SeOvzwcRS+jreqXhfUHil0DhPp+6YLn3G52OfI
         rCXq0PmkbEK4RBcg1xa9rjipE+h4R7w5bFboqpbd6D6gZ0BDwbyL4ysHxk2HgM7tvmWJ
         R+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320311; x=1707925111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbvJWnlre9MH2EiIqsIcJXmUPZrjG2BFAN9G+36KKP0=;
        b=pCIrJuw1cB6W04xrBqxY3RzO27sLWBj/5NZXFJfl4M6EddISlD8qa5R65mSuVEtujd
         DK+k+KzVy1draKFjeAzoRJ99JkWIf8BHj3RTdjFngmC1eGb+2XdMkdHa1BTEyKZ4F1H4
         gzFVTuHx8sC7VMoBc6wiNW0hnx/ShFnxEnHQndKvlzxA8Wp7WYRFPEa90P2glncV8Oaa
         Ld185E6ePNgeaT7FHL6hM8pLxC4MLcLde6Q0mqnUTJXZVGO03EkO3RXaoEY7fukJI67H
         yniVaK6E1SekUvHtT+K2SvlZLNSipyJD4RRz85bchg8XwP70PZyDAfuApN6Kr5BoFjor
         vNGA==
X-Forwarded-Encrypted: i=1; AJvYcCW75mnbJsVOtfqqu7lccwdgLoCiBW13gP2zcdiwQ1o6ehq3cuKNBpCtjZ3Yy6UszVzbqkCmrx1KNWhf6OEVU0QZ9rnWBX/hy6q7i4WXlQlpVBQ=
X-Gm-Message-State: AOJu0Yy+2RfZ2spJvao8lEaTvcm+dhYSRN/D2s/TT72IyO63YbdiOTIL
	O79Jyr9wwaAIJQDGc/Lyj7e4Gt8JCX7g8AHUURGlKWnK8kDqTWLTTJ8/XMdEjnk=
X-Google-Smtp-Source: AGHT+IGQqN+oRZ7J/ps9lkhJhgapJAFv4WN+VBydvkUTR/5OO834y+bRQjfqeYO9wqApvQHvaXOT7A==
X-Received: by 2002:a05:600c:4f0e:b0:40f:dde8:1663 with SMTP id l14-20020a05600c4f0e00b0040fdde81663mr4975194wmq.19.1707320311617;
        Wed, 07 Feb 2024 07:38:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1eYcUrPqoJ6E6XV63qXxSYuCmEy5u7Q6f5kaxMmJHILTmsgmwZdeYb1N7dcO3xGbdLEY5CdhZLczTPv8NkietV0vOOMOmNBm176mTYdh7nIZbtf2zzqNV+T3H5MOOZaCBW9yHJDykb3qEXQr6Fv1K/1RV/hWBir/thm9wO883n+ZxXl++LJv01xdCdRaLKdYvOx6g1WRd01SCDRNvNrNvTVhdpK2vVaxtBnyc/vH+pJ5qpgXcBuRIz+ADEGkO8qAeylKtbKwdcrmlLXuIX/EMRrCw5w7grPbxlWKZPgpVbfP0XqhDKiSHz2dWSAjh/CzbYeQPvgq5YFiGujLSsdG5Gjd2TeAoOAz6wpFT7stqzPJKupJpORClGMp77eZEDA9zkNxAZWVJZ23fMtBnY8bCfMAM
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c024700b0040ef0e26132sm1307678wmj.0.2024.02.07.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 07:38:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Henrik Grimler <henrik@grimler.se>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos5420-galaxy-tab-common: add wifi node
Date: Wed,  7 Feb 2024 16:38:17 +0100
Message-Id: <170732026212.120770.6589907576886281410.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206-galaxy-tab-s-cleanup-v2-1-89025c6c66c5@grimler.se>
References: <20240206-galaxy-tab-s-cleanup-v2-1-89025c6c66c5@grimler.se>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Feb 2024 17:02:27 +0100, Henrik Grimler wrote:
> By using brcm/brcmfmac4354-sdio.bin from linux-firmware together with
> nvram.txt from vendor firmware wifi works well on the chagall-wifi and
> klimt-lte.
> 
> 

Applied, thanks!

[1/1] ARM: dts: samsung: exynos5420-galaxy-tab-common: add wifi node
      https://git.kernel.org/krzk/linux/c/60f1164e21cc04666d23b63e1153af74e7a5650d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
