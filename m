Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE7D180A9C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714502874; cv=none; b=Ioe3NkKXG3oBPi0UsCeOqWzHZPqpqBW7XhHcJzSy8qm/NqSI1+V/DBDruWahezgPgiSOA/dU5CWGYXzqdih3u+0iQZ+h0ZniCDQvOmfBsxfah9fqnBWhO6p5fZZKqRp1qmcpGlkBZaYxMJmeCBnzNgxGOT0TaONOg+iWr3fmpzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714502874; c=relaxed/simple;
	bh=kGD5LDeSbcCCWAZ6A/xTsiTIRSiUSuZbqr6vAjxd3Cw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n+cWIQUOYsUUyZwNu0St9MF9+gDlGt4s2P3X3psFadRdSeq4Y17aagdHIdgPIMArindE83Z9N5FP4nFwXrs6TQQRiJANWvigzC2J8PXxCyy3ne3Mmvp/0XhZ2wDoLapaUtGjKGDVxXxO0jlnG4y7bZDwAmYSQZwModvFiw/2Bqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIPhQ9br; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIPhQ9br"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-571bddddbc2so7208711a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 11:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714502871; x=1715107671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maRahzj8h5WVnvC+mJW92etfXWS9KKobW2gRJpAJKic=;
        b=OIPhQ9brVvcrUCrjPLZwRiUAcc//4HY18rBPHNyAB/zeZvdewEWQpWlU3H+PkLi8Bh
         1iOc+su9uPMdSyhi5IxzKaBD6m8oIRUFZ1zopP2AwOpCnGGkhxUdEVZr7TJcuH2kASUW
         I6m2KwyN/9WNjrqnDSfXP5YcPxdqi6CIw9UkEUXAi3LROu9FoSP97rL4V1u4RvaE6wkw
         1/KlfMHmR69+Xvafn/jIaBX6cz0ZaVWV3cTIHGPDCEnyenZSdhoR9YRb2bgi8q2jEbNB
         B4J2v2iEPdsCmEHtSlD5i2BjuJWVaSNL4kOuZJwhAO6MJ93zRyJ+zmealJEEI4QVHJeK
         UpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714502871; x=1715107671;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maRahzj8h5WVnvC+mJW92etfXWS9KKobW2gRJpAJKic=;
        b=mOlv4RSoG+FsHtd5TUI7lZa2reTBCv6Y6fUrYNbOWxaEU1mqCdD3C9xNSIp3G18GUg
         cOgfJ6ny2CSX25/fuP86Yrryg9hOSbgNy7QXoRrxn+NVyDvraxHxJwCQmTpmBN15vgTU
         S7PGyGiihOXMLMKWH9+pObb/dlvQfe27SeVuJGnA8tkt9Par2tM6sjUofaIEe+YAqaxJ
         N+bjXqv1MHc2cOGJ6rZlFXqYmyeHktYYKKUuOegjrhYy071qHEWi+GCoFuWA1ibqfDEq
         LSQfMGQEiFypeakEjXadPWhDzITD6KRafBRpoOwJZfbrv4b/4Bcf2DxKG3WXTlO+jBKJ
         1/tw==
X-Forwarded-Encrypted: i=1; AJvYcCVlM/h6nKT838xooiKvJHmEeLAnY+VzOXjyQ7exbXeYl48npcQdJvClQiGkCYQ4IMr0PmDvEpkM9nJKnDB0Ldfgdk1fx9O7oYmVy7acfsow7QE=
X-Gm-Message-State: AOJu0YyyNuQjErK/9xRUH6e0ftrVpjS1To+Xv0tHlOLNrmrTlR09bqxb
	P6TutS0nfJSVlptz0hoOv2umhVf0afYWFZCSJlNJy0HZ/SKiSJZ+iMw5siLkCDw=
X-Google-Smtp-Source: AGHT+IGJbfmzfuk/vn40VU5LkNZp8KDxHuOXhqtzXfBuMgXu9HJtS1cNimFP4kK9KcbpUyPCXPodzw==
X-Received: by 2002:a50:99d1:0:b0:572:9f40:514d with SMTP id n17-20020a5099d1000000b005729f40514dmr458430edb.29.1714502871081;
        Tue, 30 Apr 2024 11:47:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7dc0a000000b0056fe755f1e6sm14333569edu.91.2024.04.30.11.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 11:47:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20240430141445.2688499-1-peter.griffin@linaro.org>
References: <20240430141445.2688499-1-peter.griffin@linaro.org>
Subject: Re: [PATCH v5 0/3] Enable UFS on gs101 / Pixel 6 (Oriole)
Message-Id: <171450286905.358014.14131394137410804196.b4-ty@linaro.org>
Date: Tue, 30 Apr 2024 20:47:49 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 30 Apr 2024 15:14:42 +0100, Peter Griffin wrote:
> This series contains the dts, dtsi that enables UFS on Pixel 6 (Oriole).
> From v3 onwards it has been split into separate series as you requested.
> v5 has been rebased on next-20240430, to avoid the conflicts with Andre's
> USB enablement work that was recently queued.
> 
> Along with the various driver code UFS is now functional, the SKhynix
> HN8T05BZGKX015 can be enumerated, partitions mounted etc.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: exynos: gs101: Add the hsi2 sysreg node
      https://git.kernel.org/krzk/linux/c/b5f5fe4b317c0fbda725a44d9c92d97930ad68e9
[2/3] arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes
      https://git.kernel.org/krzk/linux/c/4c65d7054b4ce8ceb30ba2b8aed90ceff6158d73
[3/3] arm64: dts: exynos: gs101: enable ufs, phy on oriole & define ufs regulator
      https://git.kernel.org/krzk/linux/c/aaafb21e8190cd2bc8cadf3e0f017bc5c11bb109

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

