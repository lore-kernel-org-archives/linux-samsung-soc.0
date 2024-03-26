Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2818C1849
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711451225; cv=none; b=iRJ7a9pmOO/uiatOCoU/B8tipjKJZoJ24mH4jaxbQFk4scJgIKczEvMifrBwFxC9R+Qa66SOKp3TGyGYoBt+EqDbfJIQsM8+5VGvC/YcyIbPLQSJMVOTcpbqVeOQswhJNTIHUqqPm2ox63qfpO3QOwakkEUDT3JvQmPJk9thmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711451225; c=relaxed/simple;
	bh=JR4ahLYJlXkLatUTLHumrxsRpmnzPs3MZecO9aOx4xo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=I6TFZNKfzGSQrQn7IKw5ip68PG6AaNp+Dor0jaLyI7+Ul+BQDxNGqJzAOHk8HzLiqcac3tLfCm/0vNvX/wPL0KJUUNnDq6JpNFOWMkmM/K7KLQ5nkqpQPhH5r1R6+UYGMFC89/TszTTMrL3jJwuxKs/s2Bm1Viv3CHjv5uKEq0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ttlT0QYd; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ttlT0QYd"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240326110659epoutp03c40b5f76e9212933c3ec4179f277b1f2~AS9Egylhj2633026330epoutp03G
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 11:06:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240326110659epoutp03c40b5f76e9212933c3ec4179f277b1f2~AS9Egylhj2633026330epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1711451220;
	bh=mwjlYpGY4nLB3O2o4E+bZgW46ONnSikPDPv9BsF/ecM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ttlT0QYd2OssdRNoCIW6Sqwr+zWnt5tTFhJ5GSaUzvmMaVd7K+IjOt0Su7DkgxVs7
	 qABESdJlFpvYoZ9uXmMm0HP+GkYqMsR+JhJ4xuxzWpZ4LTkfNkbKxy/wAml/eTMXGg
	 U8cR77tkcg8JXqV6ljOspCcs8uA5UzNcaulb6MHQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240326110659epcas5p1f24fcdfd200e41727a0529443c956c48~AS9ECfEgC2640226402epcas5p1o;
	Tue, 26 Mar 2024 11:06:59 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.179]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4V3n7N1mtzz4x9Px; Tue, 26 Mar
	2024 11:06:56 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	32.A3.09665.05CA2066; Tue, 26 Mar 2024 20:06:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240326110655epcas5p36049682faecc7862ae40dca77fe591a7~AS9ArMrDB2186821868epcas5p3E;
	Tue, 26 Mar 2024 11:06:55 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240326110655epsmtrp2c84d3ae8b5dcd1d6b5cb5e08421536b7~AS9AqWSSD1747417474epsmtrp2w;
	Tue, 26 Mar 2024 11:06:55 +0000 (GMT)
X-AuditID: b6c32a4b-829fa700000025c1-7b-6602ac50156e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	15.1A.08924.F4CA2066; Tue, 26 Mar 2024 20:06:55 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240326110653epsmtip1e154045a00b6bd6d5ee45d4b50dcffab~AS8_7k9x21460414604epsmtip1h;
	Tue, 26 Mar 2024 11:06:53 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	<peter.griffin@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <andre.draszik@linaro.org>,
	<willmcvicker@google.com>, <kernel-team@android.com>
In-Reply-To: <20240326103620.298298-3-tudor.ambarus@linaro.org>
Subject: RE: [PATCH v2 2/4] arm64: dts: exynos: gs101: order pinctrl-* props
 alphabetically
Date: Tue, 26 Mar 2024 16:36:52 +0530
Message-ID: <000101da7f6d$b6bf63d0$243e2b70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQD6o8IeErxKDZrGFPr+Y/HHTXn7CgFYjFPLAb4croOy8N53cA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAJsWRmVeSWpSXmKPExsWy7bCmum7AGqY0g/f/OSy2vNrMYrFm7zkm
	i/lHzrFa7NguYtH34iGzxabH11gtLu+aw2Yx4/w+JosNM/6xWLTuPcJu8elWnMWqT/8ZHXg8
	tu3exuqxYFOpx6ZVnWwed67tYfPYvKTe4/MmuQC2qGybjNTElNQihdS85PyUzLx0WyXv4Hjn
	eFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKADlRTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2
	SqkFKTkFJgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGXcbRQo2cVTcfJrewDiHvYuRk0NCwESi
	vWMdYxcjF4eQwG5GiRcdE8ASQgKfGCU+tEDZ3xglDjwP6WLkAGvYua8Gon4vo0TPvpssEM4L
	Ron/cz4wgzSwCehK7FjcxgaSEBFYxCjx/OxCNpAEs8BTRomDLy1AbE4Be4mPJx6BNQgLxEp0
	bXjHCmKzCKhK/Jn6BKyeV8BSYsOUK1C2oMTJmU9YIObIS2x/O4cZ4gUFiZ9Pl4H1igg4SWz+
	tguqRlzi5dEj7CBHSAgc4ZB4N2MSI0SDi8Sjb5tZIWxhiVfHt0DDQkri87u9bBBvekgs+iMF
	Ec6QeLt8PVSrvcSBK3NYQEqYBTQl1u/Sh1jFJ9H7+wkTRCevREebEES1qkTzu6ssELa0xMTu
	bqilHhL3vnYzT2BUnIXksVlIHpuF5IFZCMsWMLKsYpRMLSjOTU8tNi0wzksth8d1cn7uJkZw
	0tXy3sH46MEHvUOMTByMhxglOJiVRHhbvjCkCfGmJFZWpRblxxeV5qQWH2I0BYb2RGYp0eR8
	YNrPK4k3NLE0MDEzMzOxNDYzVBLnfd06N0VIID2xJDU7NbUgtQimj4mDU6qB6eizykPHMxdl
	uXp+jAybrFHYvo9rt27ktsdBLe4rf5mx6NyRixX38gg2vLCr+W6SNu+00oMTqg+fz/2/d7vK
	VdOtfBtfKWwPl3xnLO0xYfG11S8OupwqWnTXuvT4Lj2/q/8aLJ/umve+8KfUl1/vk+SucFQ0
	NL6M+nGtvUTTaI8xz/3fq+ZpLvnnIL1asLF+X95evqSV35Nl1j++e0yjI2L7vfCmeS+r7kuE
	TA5tXlMWNt88snBCjcMVZxXXnrnubmIsSkGSOxl8nf9P/bHyybxzG9WEfu7IW6i97ODH1uul
	nl33pkosnJ5+t1X/f1bOlzVLdNYZXpu7bu+Vdx2/dvxYvXNSwPXIeXZ5vi8WvNmgxFKckWio
	xVxUnAgAjnxLbEMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSnK7/GqY0g55fOhZbXm1msViz9xyT
	xfwj51gtdmwXseh78ZDZYtPja6wWl3fNYbOYcX4fk8WGGf9YLFr3HmG3+HQrzmLVp/+MDjwe
	23ZvY/VYsKnUY9OqTjaPO9f2sHlsXlLv8XmTXABbFJdNSmpOZllqkb5dAlfG3UaRgk0cFTef
	pjcwzmHvYuTgkBAwkdi5r6aLkYtDSGA3o8TmvYdYuhg5geLSEtc3TmCHsIUlVv57DmYLCTxj
	lFhxmAPEZhPQldixuI0NxBYRWMYoMfWzKsggZoHXjBKfll9hgZh6mFHi3puFYFM5BewlPp54
	xAxiCwtES0zeOoMJxGYRUJX4M/UJ2CReAUuJDVOuQNmCEidnPmEBuZRZQE+ibSMjSJhZQF5i
	+9s5zBDHKUj8fLqMFeIIJ4nN33axQNSIS7w8eoR9AqPwLCSTZiFMmoVk0iwkHQsYWVYxSqYW
	FOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgTHnpbmDsbtqz7oHWJk4mA8xCjBwawkwtvyhSFN
	iDclsbIqtSg/vqg0J7X4EKM0B4uSOK/4i94UIYH0xJLU7NTUgtQimCwTB6dUA1NP8fLJwjI1
	71SrvnEldr9c82yxzYcfNS+LD26qt/p558Gh5sUa/ScT3rZ6X/rJ6LxfibdExFvyoH93z4mt
	S+d2V9pcVja0lVEROmN82L3+/no/0axCxrbfkW/rfHIfnlmm9o0vbT2/8kb1xwXX1UpZoq9+
	2Hly5d7Un14/M85ZiMSHy7Bn2zj+Y1m89ZOp+OQnik8PLJyjyfn26cMH9kd2pE48uDvZYvea
	dw4mOXJX/Q6ECj54e1D9Y/G/WdvcnHq/boup22fBvWpVl0ivgklm/5Ebh5Te1829OK1z6+fp
	gu+MQzInS5Zz3lLbOVM5XqXJ+Wjo4pemHLOmSbTtDfKVPL+vr8wkf9vykhfGTSeVWIozEg21
	mIuKEwGoDTS6LAMAAA==
X-CMS-MailID: 20240326110655epcas5p36049682faecc7862ae40dca77fe591a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240326103630epcas5p23bfd30fb779e2978318575dcbbc2e021
References: <20240326103620.298298-1-tudor.ambarus@linaro.org>
	<CGME20240326103630epcas5p23bfd30fb779e2978318575dcbbc2e021@epcas5p2.samsung.com>
	<20240326103620.298298-3-tudor.ambarus@linaro.org>

Hi Tudor,

> -----Original Message-----
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> Sent: Tuesday, March 26, 2024 4:06 PM
> To: peter.griffin@linaro.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org
> Cc: alim.akhtar@samsung.com; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; andre.draszik@linaro.org;
> willmcvicker@google.com; kernel-team@android.com; Tudor Ambarus
> <tudor.ambarus@linaro.org>
> Subject: [PATCH v2 2/4] arm64: dts: exynos: gs101: order pinctrl-* props
> alphabetically
> 
> Reverse pinctrl-* lines, first pinctrl-0 then pinctrl-names. Move the
> pinctrl-* properties after clocks so that we keep alphabetic order and
align
> with the other similar definitions.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

