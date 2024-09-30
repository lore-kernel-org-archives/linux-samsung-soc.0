Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9CF18A6BC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693188; cv=none; b=iQL8skQHVTU/woqv0QeJOenxlSo8pHiSfe9BStez4Cg2pRRypOJqu4u+gahFtUN4jntf7KBL/Vt96N3Llw2DY9DWy4sQvndvK727+DYmg6jk8lWRMq76HWVIXP+OSQ21z/D+FI/8vffCdV5FlvQQdQVbbj1c3ZvAxqLBGyHivP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693188; c=relaxed/simple;
	bh=lCnldRJj8EcKbLxKLQnv0DM8eJKx8fW9IhUNQDrxfrY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pO3ihOV7oOxEtdqmIQYkJS2Y5u507v+TzL0Cinnh8nIqDZOXXssUD8yb3ggmdK/dWDdbGMq1iWck77ZH+En/NXbjT0CBTU/s09jd3pKRAlAoTjMfAvUU4qaucQyIWtIfCoC3UkTQhQEHKkLkYYEsdzzTTHFNj0VI7cWgMlDXTgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBqFL69k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBqFL69k"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42f5a663ed5so4047975e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727693185; x=1728297985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFE4eZeZ6weP2RRCOdMmrLdR7nkC0PcT5+tx/WtcMug=;
        b=JBqFL69kvrRGqqj/80SyEaycFQfdc23RsxTKn0JpLuTZHXti7sR15WNGnAcnX3eSVc
         rQdNZn9xwU0zlpIvuNsqdEKh3kgxZwTWPpQwz9D/7LZEuBLl1UeeoZm1MTvuRKC0I1Qu
         m0pKTIdw/moMoKCszBsGRarqo948OGVye53n/fdD4A6rIoPjqUcAcdHrlqE0BHryHUpL
         LDzhE0+pJAwSRlIsqrpJeSjCvK3hL/BbKmmQdH8XGo03q+4/3DW4r8Gd2d31+47jgYzM
         80709mEfWh2WSvLk/wmsxhbVGpstO4wWuQUveBMNTElNmPfXDU/NiGx/6IwgPK5cMqKQ
         aIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727693185; x=1728297985;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFE4eZeZ6weP2RRCOdMmrLdR7nkC0PcT5+tx/WtcMug=;
        b=ENicEg4CB6GXccfmLtaK13JrrdrQZxSe4z/8HpjQ3RJMpMM5+hrkAj8ZFF9BaLtbFX
         ogDgxy27yA67/ZnEaPGTGbrpSPUXKJlaf0POZ/FHGYyUR1hfcGLByy02YkhGSH8TGLLf
         LALNCpHWiemKkoo3qXqI1SRyz5juozD+UYjTReuuYGcMqP31sSwsMe0TB/PWwEhBCG01
         134qRzhTkAjCeUIlNRFiJ4Lgp2rXB+RCCyIAMGRYeh5ZplZpUg/n4MJuapWWNGEAZ72/
         M6kU++SytkrZ2OIP5HYPZ4EkGp3cTGn3KrU0TSOtyQqX9sVGvwoqL1JNzXHmviRfmPo8
         +5mg==
X-Forwarded-Encrypted: i=1; AJvYcCXRbhTbko/aJyA4MDzC0aJik0vn2pFyPI+vEz2xRV6vVwr9RWjpXovLWz6hSxpHgoVVl8uEL3UjvGhJ/7JMwJZWJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw417UHxbKvRPUTZkMveWEijYAhOI3FfN034BCw1WJS4yg7cWjl
	nSC1ZEPY2nnPrA7PE9hPaCVpKPCvy6Z/X41Adz2v5jWPEcNwnfoGY/08YaWfXj22KXwAjxahi/Z
	kSY0=
X-Google-Smtp-Source: AGHT+IEvk9FSbIzVEgOgXx9J9NrpSRuywz0Be+b84peORC+sZmXG2Y362BoPxHOnga7dUHz35qh/lA==
X-Received: by 2002:a05:600c:45ca:b0:42c:c0d8:bf49 with SMTP id 5b1f17b1804b1-42f582a34femr38710925e9.0.1727693184931;
        Mon, 30 Sep 2024 03:46:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57debe51sm98808695e9.20.2024.09.30.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:46:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Varada Pavani <v.pavani@samsung.com>
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com, 
 gost.dev@samsung.com
In-Reply-To: <20240926145132.1763-1-v.pavani@samsung.com>
References: <CGME20240926145332epcas5p2aa65366565950cf3d4f25b6c064a5fbe@epcas5p2.samsung.com>
 <20240926145132.1763-1-v.pavani@samsung.com>
Subject: Re: [PATCH 0/2] clk: samsung: Fix errors and warnings reported by
Message-Id: <172769318322.27024.16019922061491208567.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 12:46:23 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 26 Sep 2024 20:21:30 +0530, Varada Pavani wrote:
> This patch series fixes clock driver errors and warnings generated from
> checkpatch.
> 
> Varada Pavani (2):
>   clk: samsung: Fix block comment style warnings reported by checkpatch
>   clk: samsung: Fix errors reported by checkpatch
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: Fix block comment style warnings reported by checkpatch
      https://git.kernel.org/krzk/linux/c/3ee92799a212963bbd8f860b53dd8b9b5e6bf812
[2/2] clk: samsung: Fix errors reported by checkpatch
      https://git.kernel.org/krzk/linux/c/97fd5d447beff9643c2a333ebfbc95fc1d625342

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

