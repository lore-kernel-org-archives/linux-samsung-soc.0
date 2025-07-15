Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8CB2D4B75
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570440; cv=none; b=nHlYKZdBMhqoCff9ye+kSa3wgMmQkv99DNarJFNE70tpmMVMhQtX6QHrKivObahEfmOA1ujH9KGzeQ9Yr4y3oio7UWveTmHamIYfdn0Q5wvIk4wEar6y7jd1jg8YvbhPG0uUVgGNJc/BzktJq0gYsUrK3hD5vV1fBMWrUhmN/L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570440; c=relaxed/simple;
	bh=u4cIZFO83VljSE2CK6puYeLZeKZBQrk64PpIwLyG+3s=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wtv3QCylI1FMwlmVPTI3yBRJ4v484Du1C0xi9ZEHdn/i6ijW8RTZU9pRXcb8G0NWcGGZJ2P+kmY7JlAWmY80jiqJiqmpJvRQ1ah+QkMhvcRR+9ZNTP36NhBErXikHW9jB3u3aFi7rkSl4IHaBGK3DVmiAqCHG6hUp3xOGuC6di0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPWAEyub; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPWAEyub"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0df0bb8fbso84279666b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2025 02:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752570436; x=1753175236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdjGXEPbwx9d8dagmoP3TN3Sha6+88f/yNQTLVRWULs=;
        b=mPWAEyubegUeZxpl7HoJXWyzgE11N9wJ3DcattfGEmW5fqIvNWOriBfWPQDIjqgK2x
         NJGkcf+AXHM5w914sfELEoWd+R6Tft1aYmGdUaIn+hEPC8BbsiB70lTuytgoMKFK1GUd
         te4+16y+D08vhjArRdbXPSv12TTVriST2wKCs1UYVJ47g6sCXtxnrnLrDIi+5PRPNmtA
         IDKECc9cJr0g3yHN7+wylPjf9rm1rxJUoMOxKopaBbXEWCz6EunKVkMUvMUqdYI3IcvO
         YuRAkECcVL35nAbd658V8D6c8tr2No72j2mJQd9MaWZLpYwNqb14pXnuJBrwD+BUvmJ4
         Hd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570436; x=1753175236;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdjGXEPbwx9d8dagmoP3TN3Sha6+88f/yNQTLVRWULs=;
        b=PicOzMlaTZJkX5PFwf0snqmaQD1NB8vjwRn1Zr/Xy4ZQqzIAR2GmLmLjI8BUF2ZVL8
         CrY8lOKK58SPnjgb2FQYRa3qjeewZ6XF8DwmYUrAZeFjlYnxLoLvx/+Jo+LJY29Rpll6
         faqZRqmY5KAZBmASv0BLdKuZh6deIpdAcrGWJ3VO5qsp32oC2UzK8W7mXr4HDLtUVyeS
         PnFAwMtpuoZKa1OtObi2ancsI5KvusocI8J+St/A1w8rkX4CpOr/m0OreVE9p9vk8p8G
         fAco6jssvluevG7HrG/jAhUhZ5cgmEQmcdd/ZMR8ntwsulWJYbOYdmsDML5z/h5w6Td1
         cnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMLhJpfJOJe3LIRo7iBWv5wxoMv/m4JKCJ8zIi8BmQevu+XV1rvsf7S9YVvFELSov/f0gmRkKkDwyV36pvzIvEyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+VqPq/rudaHzmFUeqyIGRRCl8ImUbCe5hzoiQlXws64tOFkgx
	HaUBgUQRKuU8hqPck7V2BPx57oLPLSys5xOcpKBi4L3gfulk6rbC/TVykGeDhheg7mFwga1hF7k
	RRiH+
X-Gm-Gg: ASbGnctU6jJBxClyYYOw0WCMb7+pykH1SnQH/Rp2lF+zn/zmbOEDBpa6u8PZwhjUAG7
	ITsa0MZRFbgnUhBXxsJQtupTuWhrEUftk2BJ8BtL6OrCPSTHW1p42vOEMgMMedXjNj2u6uneCHG
	+Wc6/mEdLfjirD6JDUFWOWiuN4ZNXpq9TEnhs/bIzQ1X+2FMYWmY/Y4yBF33XwG2NOGe229fL/D
	u68cyA4oPTvSpvc9Rb1WzibwA0p70IoDGoHrf5P/OmHOvK3XP1mg+qa6zLsMld4Fe1VJkdVBlmz
	cpKrM3P3lWj1pkRRKVuyrSzRreseSRwJmvk9DX+xGcZrn8ynGpWycla/ZFLT6M86QE6n9nE/sIf
	blLOGxSZNgZVecvDyQ3FoZF/TDTGi1k5ThzWO
X-Google-Smtp-Source: AGHT+IG7sF7KS0pmEBtE7CyUxnRi/W3VS/BOjQxGcy53ccUO5o7hMkUXG853x5EsNRJefAyaqN5s2A==
X-Received: by 2002:a17:907:84a:b0:adb:2d38:4479 with SMTP id a640c23a62f3a-ae9be9f6375mr34796166b.10.1752570436431;
        Tue, 15 Jul 2025 02:07:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee459asm988001966b.52.2025.07.15.02.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 02:07:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC
 clean" maintainer profile
Message-Id: <175257043504.32608.13454383152371102716.b4-ty@linaro.org>
Date: Tue, 15 Jul 2025 11:07:15 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 10 Jul 2025 09:34:44 +0200, Krzysztof Kozlowski wrote:
> Effectively all Tesla FSD and Google GS101 DTS patches go via Samsung
> SoC maintainer, who applies the same rules as for Samsung SoC: DTS must
> be fully DT bindings compliant (`dtbs_check W=1`).  Existing sources
> already are compliant, so just document that implicit rule by mentioning
> respective maintainer profile in their entries.
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC clean" maintainer profile
      https://git.kernel.org/krzk/linux/c/7f311e5ac36b6cf9cc0734d89546e643f33b684a
[2/2] arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry
      https://git.kernel.org/krzk/linux/c/8e5bf103b3ada972ea890ae6aa2118ff9b8c321c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

