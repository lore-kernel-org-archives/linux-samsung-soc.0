Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772E53B38BC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202812; cv=none; b=jGAFat8OOeowKtWz0/W3rWmlE5GqE8Catx9WB/qOdcg4z5i/AjyFSm+dlOvjNDNzCnfGnPWhOz2YoCTg8hxGjhoML8TatMNKmwnXh4pTQi97B4uUmmYl5bTR4FCyrqwUJNNJNP98AeH9brav2xN7wpSoDKj2HJVX7XKXj86HD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202812; c=relaxed/simple;
	bh=58iLx84JGmUa71MP9XBPaAnSf2s8MxXrgG0rp1kq590=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=qGiOfx9y0SuLnY/knp910G7ybFppMMxivyVFhyk4dyruo/BPWgNvUPOUPKZ7sbqTKqcnje4cwszgFZgnBouv4xkveixJT/nawQYEa+AFyCoyvc0aRKfOdhdbGPNZccPs+gEdmyst8ExXUG0EQaRiAhFUNWWDfU6/FzDMIrW1iTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ta09Kgpr; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ta09Kgpr"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260623082003epoutp036145fd79db06c7d4eecb14735726fc7e~7qAHOoGc32365523655epoutp037
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 08:20:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260623082003epoutp036145fd79db06c7d4eecb14735726fc7e~7qAHOoGc32365523655epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782202803;
	bh=dZ4TskOON2YvURQFFWmRY4P5Y9n+8Cd9tCS6xs+1hiA=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=Ta09KgprExBRin2bxzqP9FI1SMCkP693d3x8isKsKLVoiUIFml0FLxgUiA63VVrZl
	 rEmtY8m4Xh8YWVcy7SHWRKD7EhTWdDjQRk9X1vUIlC4LO9w4Hi1bl9Yle/xjH/O24f
	 8/TFamVAMvAzBR0YFs9cF97zi46BzrhiGMcGzqMU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260623082002epcas5p2fe50239167a06f3f585cddc884be7fa9~7qAGuN5CW3001130011epcas5p2C;
	Tue, 23 Jun 2026 08:20:02 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gkyfp4tcFz6B9m5; Tue, 23 Jun
	2026 08:20:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260623060044epcas5p17e4090ee1c1c62fe06e58db8d88a97f1~7oGe2XMKK2254522545epcas5p1J;
	Tue, 23 Jun 2026 06:00:44 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260623060041epsmtip1414f32065dfa22c1ef1804df9ea3cc7f~7oGbkWuZY1819318193epsmtip1B;
	Tue, 23 Jun 2026 06:00:41 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>, "'Bjorn
 Andersson'" <andersson@kernel.org>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Brian
 Masney'" <bmasney@redhat.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Peter	Griffin'"
	<peter.griffin@linaro.org>, "'Barnabas Czeman'"
	<barnabas.czeman@mainlining.org>, "'Tomasz Figa'" <tomasz.figa@gmail.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<cpgs@samsung.com>
In-Reply-To: <20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 11:30:39 +0530
Message-ID: <1212772528.01782202802678.JavaMail.epsvc@epcpadp1new>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLjF+4RorsKFMyV2SdeBPjDChM9owMQIOWktCb6JMA=
Content-Language: en-us
X-CMS-MailID: 20260623060044epcas5p17e4090ee1c1c62fe06e58db8d88a97f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260623055640epcas5p35fd0bc8b355d23ca802ceba85046b836
References: <CGME20260623055640epcas5p35fd0bc8b355d23ca802ceba85046b836@epcas5p3.samsung.com>
	<20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Tuesday, June 23, 2026 11:26 AM
> To: Bjorn Andersson <andersson@kernel.org>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>;
> Chanwoo Choi <cw00.choi@samsung.com>; Peter Griffin
> <peter.griffin@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Barnabas Czeman <barnabas.czeman@mainlining.org>; Tomasz Figa
> <tomasz.figa@gmail.com>; linux-arm-msm@vger.kernel.org; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH] dt-bindings: clock: Replace bouncing emails
> 
> Replace permanently bouncing email addresses (550 5.1.1 Recipient address
> rejected) of Adam Skladowski, Sireesh Kodali and Chanho Park.  There are
no
> new messages from them via other email addresses, so drop them
> permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC clocks,
> because he looks at other Samsung clock hardware and drivers.
> 
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> 
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>


