Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453666EB7E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708280514; cv=none; b=RJ834py2sK3qBFfsIh8ow1pEdfB4nWMmIz6H0qzkpsutGves1dvtqV6XZv6QvL/WHkfJqRvYDQ5AhH4LavO3+Jpk+QfyWI0OVpn0yOCg5in1xGhvIauSBn4/ElLA0iVTDqt/NRJmchPmQ6IoRJY1EVEobeevNbGu3gjJJCBScjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708280514; c=relaxed/simple;
	bh=LJxopLRjYY608VyXan9A7AaAXQEYNJo9WMc9BDYf3lI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FFy76X0BdIyXsJCuBGVbxtWSehrH+DpuNe0AwUGNy61NsZotvKBJQaLKaoccn14Pxq2YQ37jv5CLh23GS4nT0KNwUezPFLFstSwQ3wzXy2TRbg+O8XwhpZKSVcpJY9QhZJ6ZTvEM73fvkzVPINrxkbqs7HCMkv1YkN9oNqtY5A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJOTZ959; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJOTZ959"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d146737e6so2080569f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280512; x=1708885312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN2+Eq6M3kaqLi0K2pEbsSinjMNz96Hcn5dAVh4QPNs=;
        b=pJOTZ959KQir4IqTQQVBRf1pjq+nwEOOIBZK/hN4dAsuN7THtUFZ2OAdHFIHiEGIzj
         FZ8LpTDj375fDMKvJtyo9Dhdikx44AGLWp+/fCHUS16AypmyxbtLhVPi/PqTRvVDA/GD
         etLYunZ1Oa5k9F3NatgK7aYgZgaB1R+eOqqztjS1La2rxZww/sekhpISXnaW84jh6VZx
         IzQI7Ppeh03Kgs/pJTWs64ceFAhAKryRKmUFWqqlIhUjgm3KlRq1uzplR8DTlukkEVWr
         kl1LDcDZbsFjTs1OCbsyo0N8LgGnudbP70ByVZO5f6SqvYH3JZtUUhO7DKxvm8BI72z+
         0yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280512; x=1708885312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KN2+Eq6M3kaqLi0K2pEbsSinjMNz96Hcn5dAVh4QPNs=;
        b=GOmT8DNMwoKIVgsemkFQTFYgKvKVn1pLiYqHGskr3F7ZtVTXsi8PTTkPzf6eRxOQ1R
         Hw7XW2XLTBqshn4Mgar/U8+QMum7tEHKW4arX5KaFz9fBRbmf04zULcX+Nqn0is5LO3w
         0cOksVyyubSO0ZUis5IQRMPivudexBwdoifqTWLGP6kJDyLteEwsWwokNnXMyjqKbdMF
         cVu9oszf9wSV/b5fPR+0AtfqkHx0QheorWTzX7gahu1o/TR7X+J8kj0UEpUmSiI8NS7d
         B6b6xDJu+kD5Bc95xuiWpbRHCEi0+8Wkv3EIHXhNsEbJqWLDHAJztpvN5ti4C27HnwIU
         nJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8qkqlQ5ZSIcKE+ZYkBdLm5mg8J2lWfWvKHnLdovcRmNKJJzb4n9g+uy4cfi/d/t0ABJsWj6qxjTCtqoCW7kHDZDerbUKT7XDTn3o8zJBoh08=
X-Gm-Message-State: AOJu0Yys18m08u3U48SMbz2XPqgKnU/WN13dH2KN3ja8tGERFWuEK3s8
	RZnyhZFKXS5VFDPXUDjcTyzYFjggEFHBe05D8lbDsX8gbIoj+hIc66kej+I1LIE=
X-Google-Smtp-Source: AGHT+IHuj1yYst44BTBRKd1yoMt+P8wTEeoo+gGgmG1sod8COMU81at5eXmH7/21JETmWBv+qcbvcw==
X-Received: by 2002:a05:6000:1542:b0:33d:28a9:2fd8 with SMTP id 2-20020a056000154200b0033d28a92fd8mr4631677wry.39.1708280511691;
        Sun, 18 Feb 2024 10:21:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4ec3000000b0033ce06c303csm7867116wrv.40.2024.02.18.10.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:21:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/4] ARM: samsung: soc for v6.9
Date: Sun, 18 Feb 2024 19:21:41 +0100
Message-Id: <20240218182141.31213-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
References: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.9

for you to fetch changes up to a3891621d4a0783ae178d6f2845517e3dd571dd4:

  ARM: s3c64xx: make bus_type const (2024-02-12 08:28:44 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v6.9

Just cleanups: kerneldoc warning and add missing const to bus_type.

----------------------------------------------------------------
Randy Dunlap (1):
      ARM: s5pv210: fix pm.c kernel-doc warning

Ricardo B. Marliere (1):
      ARM: s3c64xx: make bus_type const

 arch/arm/mach-s3c/cpu.h     | 2 +-
 arch/arm/mach-s3c/s3c6410.c | 2 +-
 arch/arm/mach-s3c/s3c64xx.c | 2 +-
 arch/arm/mach-s5pv210/pm.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
