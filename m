Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C58A18D63E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jan 2025 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738324172; cv=none; b=nUd4n3RG5tFs6KxSP4NAhRZJ8xSt9yiNRTKOrl1Ct1XH90tQ+73/UdhcIle0NyuIznktU4mX6Kv0jE8BijAM8S7XIhRjReXO2cURsa36vghCUfSyI8irwzg3B+j54o+PiYMeLsAewg6QG/OkUuDt6lmzwydxSFHoevSGoSQ87U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738324172; c=relaxed/simple;
	bh=bdM8kwCSpd+swBF/nNVjUrCr/OdvWf/vy+aAbPE9BVs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=hEZsTD+BdkqGJ5nCROz9/02AE1efIu9JrZh0C1TJJNnrHMA9cUnzGXuROXmfUXxcgr0Gk/ZigadG2tIhL+8uaBCseu4TJVUF+0igM+31RiHhUgwgjSAzid0l4JHUYZVt+pbRM9XMbz6FF+zJegDOrC8js6Mk2Gn5u081XrVRpUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CdN5y4xd; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CdN5y4xd"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250131114925epoutp01e110ddfb14297a43fd6137ea8d816d49~fxJ5NNmKQ3168531685epoutp01L
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jan 2025 11:49:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250131114925epoutp01e110ddfb14297a43fd6137ea8d816d49~fxJ5NNmKQ3168531685epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738324165;
	bh=1VF7L0btICqk2wHhE3JT1nnDyIGYllk7XVIyRQ7TbrQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CdN5y4xd8OdLcwVgrQXuLLHYf1eycnc1Fzo/ci1+yb0yv8fyY71TNgziP3pvVdD0U
	 MaqxxFvWCACWMhngjm/+79zXw3+7KsUdxP/3TVB1ZeNNEhXkhloS8WnhV27hnpYlja
	 Jg1jkJuNbWx+wLi1TNu7p/QIDEzGoF0sKnRnYpHQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20250131114925epcas5p39368936432b8bdb8fd724acb20a3b959~fxJ5Bt7me0949509495epcas5p3R;
	Fri, 31 Jan 2025 11:49:25 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YkvLq1L38z4x9Pq; Fri, 31 Jan
	2025 11:49:23 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9A.96.19933.2C8BC976; Fri, 31 Jan 2025 20:49:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250131114922epcas5p25b45c8d4dea3a13b1c8383d50602ecfb~fxJ2VEFvR0659206592epcas5p2r;
	Fri, 31 Jan 2025 11:49:22 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250131114922epsmtrp1537a9bb65a89b156dd6c99e18ca08d15~fxJ2UUUYA1535815358epsmtrp1a;
	Fri, 31 Jan 2025 11:49:22 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-0b-679cb8c2914d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	45.DB.18949.2C8BC976; Fri, 31 Jan 2025 20:49:22 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250131114920epsmtip24b746f93fd222aa5ed6f3f9749965fcf~fxJ03I1vi0674806748epsmtip27;
	Fri, 31 Jan 2025 11:49:20 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250108055012.1938530-1-dev.tailor@samsung.com>
Subject: RE: [PATCH v2] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Date: Fri, 31 Jan 2025 17:19:09 +0530
Message-ID: <006401db73d6$2af35fb0$80da1f10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJnCMNmj1amGSmPwLixER7WDeLbQALDHLFMsgMBQSA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPJsWRmVeSWpSXmKPExsWy7bCmpu7hHXPSDTqfMVms2XuOyeLejmXs
	FvOPnGO1uHZjIbvFy1n32Cw2Pb7GanF51xw2ixnn9zFZ/N+zg92B02PTqk42j81L6j36tqxi
	9Pi8SS6AJSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNct
	MwfoFCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgUmBXnFibnFpXrpeXmqJlaGB
	gZEpUGFCdsa0911MBbsEKvZvv87UwDiXt4uRk0NCwETi6f4zjF2MXBxCArsZJV4svAzlfGKU
	+NXylQnC+cYocXHGFxaYlut3PkBV7WWUuHd4C5TzklGio289WBWbgK7EjsVtbCC2iECBxMzJ
	98GKmAVWMUoc7lsH5HBwcArYSWxexANSIywQJLFg6hF2EJtFQFViUus5VhCbV8BS4tXb9ewQ
	tqDEyZlPwOYzC2hLLFv4mhniIgWJn0+XsULsspJoXnWOCaJGXOLlUZCZXEA1czkkllxZwQrR
	4CLRf/QF1DvCEq+Ob2GHsKUkXva3QdnVEus3zIOq6WCUaNxeA2HbS+x8dJMF5H5mAU2J9bv0
	IXbxSfT+fsIEEpYQ4JXoaBOCqFaVaH53FWqKtMTE7m6oCzwk3l+bxTiBUXEWks9mIflsFpIP
	ZiEsW8DIsopRMrWgODc9tdi0wCgvtRwe4cn5uZsYwSlVy2sH48MHH/QOMTJxMB5ilOBgVhLh
	jT03I12INyWxsiq1KD++qDQntfgQoykwuCcyS4km5wOTel5JvKGJpYGJmZmZiaWxmaGSOG/z
	zpZ0IYH0xJLU7NTUgtQimD4mDk6pBiZJh3nz/0awe3ysTxROM+i7LZR65vARx3MzLMqP+fyJ
	js4OiN+3+q7u1If9cm28WWE3l+c+eWEubn7v1NLDXdvMVnF+42YSfLjOzqQmL/kM17N7t+3f
	nZq/Omln+QEG45cdfoxHuL9JKKRuWnvjAJtszlZFz8CqbnbOoovFl1gSTzwq/fby79uuA7aR
	zMeXLE+fZFEQ5J0rO1fgwlJmV7aejj9dYn8WCX74UT6tTDw5wSZT/mjYxcP+CRUuPPEemYGN
	WQ/O3zhyu26e6B6hb/XWqlv3/fq/N0LoVnLEKpZN/gfF7vI3WIszhzv8d4lVXrsz+eXEAgY5
	izefvE5cqLNgO8TVknlDlel9ac7+e0osxRmJhlrMRcWJAGcqBG0yBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42LZdlhJXvfQjjnpBi2bOSzW7D3HZHFvxzJ2
	i/lHzrFaXLuxkN3i5ax7bBabHl9jtbi8aw6bxYzz+5gs/u/Zwe7A6bFpVSebx+Yl9R59W1Yx
	enzeJBfAEsVlk5Kak1mWWqRvl8CVMe+xUcEf/orJBzewNzDe5+li5OSQEDCRuH7nA2MXIxeH
	kMBuRol9x2eyQySkJa5vnABlC0us/PecHaLoOaPEpVXPmEESbAK6EjsWt7GB2CICJRI7ljSw
	ghQxC6xjlPj1/DpYt5BAP6PEpqehXYwcHJwCdhKbF/GAmMICARIH9kiDVLAIqEpMaj3HCmLz
	ClhKvHq7nh3CFpQ4OfMJC4jNLKAt0fuwlRHGXrbwNTPEbQoSP58uY4U4wUqiedU5JogacYmX
	R4+wT2AUnoVk1Cwko2YhGTULScsCRpZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjB
	MaWltYNxz6oPeocYmTgYDzFKcDArifDGnpuRLsSbklhZlVqUH19UmpNafIhRmoNFSZz32+ve
	FCGB9MSS1OzU1ILUIpgsEwenVAPToceLC1+6BnPkTPlv7Vs7914/a8Dt+JvCRuK1TZ/iem7/
	ffMmbLfxyuZu5TnlL700m5d2btfYruQ73XFH6lFTpbo76Tt3m4ldc+nfJmTTGcZvlLP35sIN
	7hd6Ax026r5g4/sr1uzjsH2X0M4b8ka3DgSWPZfUX/Fs5+5PJq0TM07OqhdZe5qfmenevjVC
	2w4ky9570HSzoMTyl+GT/I23Ap9KTJSZ6fLu/f3JGecW/VZlk1tav1yu5/bFsPsyvTJLBcMn
	/V8pv6SFQZSrL3Zna+CNi1K8UvXnl1qzVyhX+G70OtV89/kRvju8W2f6G+bKruX90cV7pubw
	RLmXayPmRNSIr35T96RratkkTckaJZbijERDLeai4kQApmXWXBgDAAA=
X-CMS-MailID: 20250131114922epcas5p25b45c8d4dea3a13b1c8383d50602ecfb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
	<20250108055012.1938530-1-dev.tailor@samsung.com>

Hi Devang

> -----Original Message-----
> From: Devang Tailor <dev.tailor=40samsung.com>
> Sent: Wednesday, January 8, 2025 11:20 AM
> To: alim.akhtar=40samsung.com; dev.tailor=40samsung.com; robh=40kernel.or=
g;
> krzk+dt=40kernel.org; conor+dt=40kernel.org
> Cc: devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;=
 linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> faraz.ata=40samsung.com
> Subject: =5BPATCH v2=5D arm64: dts: add cpu cache information to ExynosAu=
to-
> v920
>=20
> Add CPU caches information to its dt nodes so that the same is available =
to
> userspace via sysfs. This SoC has 64/64 KB I/D cache and 256KB of L2 cach=
e for
> each core, 2 MB of shared L3 cache for each quad cpu cluster and 1 MB of
> shared L3 cache for the dual cpu cluster.
>=20
> Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
>=20
> ---
> Changes in v2:
> - Added L3 cache for all the three cpu clusters
> - Corrected L2 cache numbering as a part of review comments from Krzyszto=
f
>   and updated as per cpus clusters.
> - Link to v1: https://patchwork.kernel.org/project/linux-arm-
> kernel/patch/20241231064350.523713-1-dev.tailor=40samsung.com/
> ---
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi =7C 127
> ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>
=5Bsnip=5D
 > +		l3_cache_cl0: l3-cache0 =7B
You can add one node for cl0 and cl1, say =22l3_cache_cl0_cl1=22 and
Remove the specific node for CL1, because both are same.=20

> +			compatible =3D =22cache=22;
> +			cache-level =3D <3>;
> +			cache-unified;
> +			cache-size =3D <0x200000>;/* 2MB L3 cache for cpu
> cluster-0 */
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <2048>;
> +		=7D;
> +
> +		l3_cache_cl1: l3-cache1 =7B
> +			compatible =3D =22cache=22;
> +			cache-level =3D <3>;
> +			cache-unified;
> +			cache-size =3D <0x200000>;/* 2MB L3 cache for cpu
> cluster-1 */
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <2048>;
> +		=7D;
> +
=5Bsnip=5D
> +		l3_cache_cl2: l3-cache2 =7B
> 2.34.1


