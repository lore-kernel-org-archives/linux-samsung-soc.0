Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617173;
	b=1CosMDcqxKQAALYzvl63jwKd/g9a2VzcxjBtbw5LwFKyHOsKSGt0zeM1/tbdyz7bOImX
	 3ODT/2Jyh+KGltM9JXT1OlfLFq+PrMPGRqTaShRjX/GPJ1pivq9NmobbUm5qpKZgGccNm
	 SPENH7UO9Bjo/DIDzs0FTYqXFfo3dKtYsS1vrpWYtN86dRwl0vcIVnM9m1U6reLJulFuU
	 hYV06dFipkupJ4IIYJczX/C5hKx9afvym07aC+Xb1xPEMHUx0yinLty0x/+hla0FRqOqb
	 fyyzKS3dkfG2+H2iJc+8xMJTmkSdRYE1RH90B2g75SLY5lba2kYw6x29tlJ8YG2xhkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617173;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ee+0w4xlD5ELK5Ml16S7G83YFTChVMAe2H1W94F6EnM=;
	b=hwfkMzCC92J0sa8/ICYQtmxOBVNtHzpFu9OJDNwlZeoNAsrtgfzl2xZ40NB614aU5goo
	 9EAu2n6bBPDtvRELQOOSN8o1Y1erIzY5A4QH0NfO7BRwdBvKsvrOJMpNcRq06nyF1h87G
	 scGLiiSqJZhFV6kqMZdYEcHfV3wRr5Zg1Y+1snxMJwelmPLQUAPbMEVt7G8ZmoqqWzMUw
	 8Wxw3IMtOa+T59GkE7XDJpN9oQlUyNsn7nde4SuvUmlAkqGqS6OiMo7VsA3uuKrhQ/DSV
	 pQkeTjEdXMpM2HKZPbNbEkPVc0yul3jDMTaVLUyZRPa3h7/YXo4Y15hPWeG6p7n392A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=xn2yY9af;
	arc=none smtp.remote-ip=79.135.106.104
Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C845D606A32E;
	Mon,  2 Nov 2026 10:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C845D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=xn2yY9af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793617170; x=1793876370;
	bh=ee+0w4xlD5ELK5Ml16S7G83YFTChVMAe2H1W94F6EnM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xn2yY9afilndurnQVUzn0jI13yubFLI6FMDwLqagV7p+nij579en7Klu7t1WVe8Hm
	 ExXZYZIXdK+UrDTVMwCufafhY4cXP2JJiDm3nx35hEZ4BzZ+9qa45sGU0xXpy3DQjD
	 y42H+q59cwtaTpIoVU62T6oK8CyDFEUwWfi+s8OtfKoPZzt4jW6U9LgniWg64hrsrx
	 bC1hY90/E0Bma2soBSfDGkpjwPUZ/y4nQWinrHqD94H2odsVSrmjqQ7XpKacXy9bFa
	 jTBIKkMX+pukMz3NmL4/bvYMEgxUg7ruOIigNncH109C7/t3P3Ak4RBv9NPLJJ2Tlk
	 qPFVYHpwI+YoQ==
Date: Mon, 02 Nov 2026 10:59:23 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: samsung: Add lucky7 board binding
Message-ID: <oQggKJyvPN7MEiO3hqH401UfQAGPL5C5o7_Ybg1EXSh_m6aq_d3hKX9bwovgUqDkOTf0zCtHXZjaBHMc7tY261ze6m3AeufMxCi2iUg8ro0=@protonmail.com>
In-Reply-To: <20261102-origami-shoebill-of-fortitude-ddf566@quoll>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org> <20261030-for-next-lucky7-v3-3-81e02272ce69@member.fsf.org> <20261102-origami-shoebill-of-fortitude-ddf566@quoll>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: eff9712326438b909497253eeb7a4054cbeb4443
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Krzystof,

> This looks misplaced. Entries are sorted by the fallback compatible.

I'll keep this ordering convention in mind for future board/soc additions.
I was trying to order by description (ExynosXXXX-based boards).

Will fix in v4, next merge window. Thanks.

Kind Regards,
- Aiden Isik
