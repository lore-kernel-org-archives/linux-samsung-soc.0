Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96E3DCDB1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093090; cv=none; b=Zg/Ik9e+QR5TVOJD8mNYMaFf+ql4IKOX2VI38+NVXW/kk9ATh9vF+vx+09F4i+pTcnLIoXngzZjYGZcBlLl7OTct11N52PdmKYBRkuR/efwuGuKc7bJV/j6BL+AIX+aPKIGp7hid/G0o88DV2BmX+AQDt0nStJy05V5fzJPokiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093090; c=relaxed/simple;
	bh=PGLEj1xrBTqr7J8Les/xvRr9gUoXnua4+jADkh9Ou70=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=MHYG/QmCDTU1Gf+jswrDmsVkKpLv63OeiO4AkK/IJbgkoD4+UrYVMrghzPwFpOu52IHkfhRJdtJ7BCm5VCMjxpNcHrLZMJF0Ncvgr+rxvxnqDLSB37pAyrhzLaLtX5J2K1kCANwyz+NtBRcxH3KRftdr8Y/pwZK5NWfP/yP5z3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CVrpVLtG; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CVrpVLtG"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260911021803epoutp034b7b17978e37ed28c1ea6ce922a6dd17~UIq4tu9Mk1031210312epoutp03g
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260911021803epoutp034b7b17978e37ed28c1ea6ce922a6dd17~UIq4tu9Mk1031210312epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093083;
	bh=nobdwUh78N0lwa7Juyg7zXqI0l6ZQkrO6PqvD0/2jM8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CVrpVLtGhMCJ1RbcegGK/DVMTSMHzCuCRYKOtLJttwxNKCQvk82pz9MdRZI2P6DOa
	 BoUKrXNnPbCjJbnEYpjf/jhaU7k1+arZLETiP6XGnckOFU0Z5nx6LWt2NBxMOKUbr9
	 OTWKd2gkx7vNJw3LCnRo2X5vIGCnEAhpooV1b2qE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260911021802epcas5p28c0adc2bde933b8a6b454c74852291bf~UIq4Jv8fu1335513355epcas5p2M;
	Fri, 11 Sep 2026 02:18:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hgyrB5plgz6B9mJ; Fri, 11 Sep
	2026 02:18:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260910151926epcas5p2b0279e476b522f7638315e16eae61ab2~T-r2HCKJJ2363923639epcas5p2g;
	Thu, 10 Sep 2026 15:19:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910151925epsmtip27b81f9a7a604224d26f992bcf2acea8a~T-r0veMv51938519385epsmtip25;
	Thu, 10 Sep 2026 15:19:25 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-1-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 1/5] arm64: dts: fsd: Fix indentation of CPU nodes
Date: Thu, 10 Sep 2026 20:49:24 +0530
Message-ID: <339099861.21789093082802.JavaMail.epsvc@epcpadp2new>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngHz7T+SAZgkCOq16JXm4A==
Content-Language: en-us
X-CMS-MailID: 20260910151926epcas5p2b0279e476b522f7638315e16eae61ab2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141809epcas5p3e4294752e988d2eed9ec132e5b40f1c0
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141809epcas5p3e4294752e988d2eed9ec132e5b40f1c0@epcas5p3.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-1-1b755a446b22@oss.qualcomm.com>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Wednesday, September 9, 2026 7:48 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-fsd@tesla.com;
> Krzysztof Kozlowski <krzk@kernel.org>; Peter Griffin
> <peter.griffin@linaro.org>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH 1/5] arm64: dts: fsd: Fix indentation of CPU nodes
>=20
> Drop one tab too much to fix dt-check-style warning:
>=20
>   fsd.dtsi:198: [indent-consistent] indent mismatch (expected depth 3 * '=
\t')
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


