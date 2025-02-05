Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6FA21518A
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Feb 2025 04:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738729940; cv=none; b=GK0hM3W1AVBsWSKhGuhiDQ01qoMLsoPLj75pJwK33DuXI+to4TN4mggKl7YqqTKGX7Rdm3SVOvhtwNZLTU5IdpKVyG9162TRpyzzex4d8uwRcCh5TWXGi/4vxP+m+xppIl0mI5Uq1Derm5rreG34ZSDoqNbWgVWJiYkY+k1douA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738729940; c=relaxed/simple;
	bh=muj42tyeArJlDap25NrLqG4C3MwLw+2Bs0jim938Rt0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=HZcCQq/lifhpG5pimN12EPtMyNm8e/L3cpmGkTCRNRzpxGvM/lC7g4wlm3dDKUGUYelbiArMEfIrQcR2RnXtpl5KAK3za6SP7Ki4wsceAmURQ9ImUj1W1aKGUuOY8fgKcTHAhiN0lfJFSe9t+IwQ3Hxwd/V/w5ESXLfaXzvHEyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rVVfJkXk; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rVVfJkXk"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250205043216epoutp0143841248f48b99b6927afc9194eab9a9~hNapMFVKs1828518285epoutp01L
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Feb 2025 04:32:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250205043216epoutp0143841248f48b99b6927afc9194eab9a9~hNapMFVKs1828518285epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738729936;
	bh=muj42tyeArJlDap25NrLqG4C3MwLw+2Bs0jim938Rt0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=rVVfJkXkNM4+ORYrriZW/IURQDIBmT9YxDVzisGWMtE5ceOPYP3GUfFimRGdXikhu
	 N/kjQjwArlsD+vvFjjrrgIs5jI0PxABOPpb8gREXy+Qz/QJ9WiySn/LMr595GTpWhB
	 b9Sq61KJGoLbRFxYmgou6IhmIomKwDlZcVTJwGyY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250205043216epcas5p4c35ec9557541c7a3a0cd3b289ab5671c~hNaou06632827328273epcas5p4m;
	Wed,  5 Feb 2025 04:32:16 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4YnnQ60cFFz4x9QK; Wed,  5 Feb
	2025 04:32:14 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D3.30.19956.DC9E2A76; Wed,  5 Feb 2025 13:32:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250205043213epcas5p2fe2c5d145ce2caef582fa2e977a7b576~hNamZm0y00178501785epcas5p2J;
	Wed,  5 Feb 2025 04:32:13 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250205043213epsmtrp27c0b673b0deea66310db225e85847a08~hNamY0OuK1380613806epsmtrp2t;
	Wed,  5 Feb 2025 04:32:13 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-c5-67a2e9cd87d3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D9.43.23488.DC9E2A76; Wed,  5 Feb 2025 13:32:13 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250205043209epsmtip1521c464368bd125cbd4eb08cca2fa0c2~hNaizkCtT2478124781epsmtip1M;
	Wed,  5 Feb 2025 04:32:09 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: =?UTF-8?B?J+uCmOyGjOybkC9TT1dPTiBOQSc=?= <sowon.na@samsung.com>,
	<vkoul@kernel.org>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<robh@kernel.org>, <krzk@kernel.org>, <conor+dt@kernel.org>,
	<kishon@kernel.org>
In-Reply-To: <000001db658c$4dce63c0$e96b2b40$@samsung.com>
Subject: RE: [PATCH v4 0/3] Support ExynosAutov920 ufs phy driver
Date: Wed, 5 Feb 2025 10:02:05 +0530
Message-ID: <080d01db7786$ed980e90$c8c82bb0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH4Gf4Ht2pT+J2pScYPrVRUV1+UogJvt6+kANXfQc+y5KuVAA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLJsWRmVeSWpSXmKPExsWy7bCmhu65l4vSDSa1MFqs2XuOyWL+kXOs
	Fkdb/zNbvJx1j83i/PkN7BaXd81hs5hxfh+Txf89O9gtfv88xGSx884JZgcuj02rOtk8+ras
	YvT4vEkugDkq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DX
	LTMH6BYlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToFJgV5xYm5xaV66Xl5qiZWh
	gYGRKVBhQnbGnaZXbAW3OSqWbNFqYNzE0cXIySEhYCKxclMDaxcjF4eQwG5GiRs3TzFBOJ8Y
	JZZ0/WeBcL4xSjTsamKEabm18QwzRGIvo8SXKQuhWl4ySsz4eQisik1AV2LH4jY2EFtEIFLi
	z9IfbCBFzAKXGSX+HpjCDJLgFLCSOHL2EFCCg0NYwFFi2hcukDCLgIpEW9c1JhCbV8BSYs2r
	I8wQtqDEyZlPWEBsZgFtiWULXzNDXKQg8fPpMlaQMSICThKt7d4QJeISL48eYYcomckh8We5
	JITtIvHz7RI2CFtY4tXxLVA1UhKf3+2FildLrN8wjwXC7mCUaNxeA2HbS+x8dJMFZBWzgKbE
	+l36EKv4JHp/P2ECCUsI8Ep0tAlBVKtKNL+7CjVFWmJidzcrhO0h8eF/H/sERsVZSP6aheSv
	WUgemIWwbAEjyypGydSC4tz01GLTAuO81HJ4bCfn525iBKdTLe8djI8efNA7xMjEwXiIUYKD
	WUmE9/T2BelCvCmJlVWpRfnxRaU5qcWHGE2BgT2RWUo0OR+Y0PNK4g1NLA1MzMzMTCyNzQyV
	xHmbd7akCwmkJ5akZqemFqQWwfQxcXBKNTA1G/NzT939653EP86sBf660YJ9Xnzu3/JOfG2c
	mRJbFZbY+ljPNffwxIq9h7I3n+AtnVS8cm3RR8bzxrrXY2qENv5RPRH9L5rzZcGWwuPOqTsC
	O9WVjOdpLbefs6L2zvblN5r+X1/Y+fNmA0tD3sqly9Ib7I9caurLkvp58pD6u4j9NcI3E6P/
	szKHVf99erbGKr94d+7vSXmHJ5ntufnOszWs9+TiKebPrVOXHl02PffQtN9XlR6HOYnJsa54
	u8U+Zt19s+797B/W3Zr86WRg+xPNDLsoT3nu+WWzipfnSeW9+f287+vVpuDMCfNkL3aae21e
	t2/vu6n2Apf5TrGe910WIdZ0nvuU1aNXN5S1lViKMxINtZiLihMB3UKaSTAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42LZdlhJTvfsy0XpBlevqlms2XuOyWL+kXOs
	Fkdb/zNbvJx1j83i/PkN7BaXd81hs5hxfh+Txf89O9gtfv88xGSx884JZgcuj02rOtk8+ras
	YvT4vEkugDmKyyYlNSezLLVI3y6BK+PGsbuMBUvZKuZdkG5gnMfaxcjJISFgInFr4xnmLkYu
	DiGB3YwSi9/cYINISEtc3ziBHcIWllj57zk7RNFzRok/d24wgSTYBHQldixuA2sQEYiU+LP0
	BxtIEbPAbUaJiU8usMONXfR+JVgHp4CVxJGzh4CqODiEBRwlpn3hAgmzCKhItHVdAyvhFbCU
	WPPqCDOELShxcuYTFhCbWUBbovdhKyOMvWzha2aI6xQkfj5dxgoyUkTASaK13RuiRFzi5dEj
	7BMYhWchmTQLyaRZSCbNQtKygJFlFaNkakFxbnpusmGBYV5quV5xYm5xaV66XnJ+7iZGcFxp
	aexgfPetSf8QIxMH4yFGCQ5mJRHe09sXpAvxpiRWVqUW5ccXleakFh9ilOZgURLnXWkYkS4k
	kJ5YkpqdmlqQWgSTZeLglGpgyqpt3GV1trAtQiskRTZ76YvpC6bNVm+ffsPL+gn3z3d6QVId
	eRLOFZlTjB2OcHPVWC9wF5GvYxI0febyKKCoelPPnPr2l9udU1Vj7GK6n4rzTAkIbbdTKZCx
	ZEk7NGVF9UL76GvHZ0zeJK4pOPuaorPw/BPiwc+Pm36Y67FRx7c0bl3JHOfSX9cl5u7e+GUO
	V67/yReVW1qu61mlmf86v9QnpW9lPJNQaLOaHdPmEulv8Xe/TsqoEZJ5/Krg0qyzO46ufmiV
	5mtcXsJ1ffuFt07ir/f5th4WOHvxcd8+luXr+GqjE39m8miVRzZqbr64/0jOrCYWMemLp10d
	Cx7FnOS78fQgv/b0AyuKApYqsRRnJBpqMRcVJwIAfFJd0RoDAAA=
X-CMS-MailID: 20250205043213epcas5p2fe2c5d145ce2caef582fa2e977a7b576
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6
References: <CGME20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6@epcas2p4.samsung.com>
	<20241226031142.1764652-1-sowon.na@samsung.com>
	<000001db658c$4dce63c0$e96b2b40$@samsung.com>

Hello Krzysztof / Vinod

> -----Original Message-----
> From: =EB=82=98=EC=86=8C=EC=9B=90/SOWON=20NA=20<sowon.na=40samsung.com>=
=0D=0A>=20Sent:=20Monday,=20January=2013,=202025=2012:55=20PM=0D=0A>=20To:=
=20vkoul=40kernel.org=0D=0A>=20Cc:=20krzk+dt=40kernel.org;=20linux-kernel=
=40vger.kernel.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linux-samsung-=
soc=40vger.kernel.org;=0D=0A>=20robh=40kernel.org;=20krzk=40kernel.org;=20c=
onor+dt=40kernel.org;=0D=0A>=20alim.akhtar=40samsung.com;=20kishon=40kernel=
.org=0D=0A>=20Subject:=20RE:=20=5BPATCH=20v4=200/3=5D=20Support=20ExynosAut=
ov920=20ufs=20phy=20driver=0D=0A>=20=0D=0A>=20Hi=20Vinod,=0D=0A>=20=0D=0A>=
=20>=20-----Original=20Message-----=0D=0A>=20>=20From:=20Sowon=20Na=20<sowo=
n.na=40samsung.com>=0D=0A>=20=0D=0A=5BSnip=5D=0D=0A>=20I=20can't=20see=20th=
ese=20patches=20in=20-next=20yet,=20do=20let=20me=20know=20if=20anything=20=
is=20missing=20to=0D=0A>=20be=20addressed=20from=20myside.=0D=0A>=20=0D=0AW=
hich=20tree=20will=20this=20series=20go=20through?=20=0D=0A=0D=0A>=20Best=
=20regards,=0D=0A>=20Sowon=20Na.=0D=0A=0D=0A=0D=0A
