Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794448303;
	b=gKh4OkQarzksuFTpGh8z3iK0PGHR18KI+oBSeDvex2yZQAmr+56vB0m/Eo1jwZNcYUwp
	 +5W2rKYsf6v8ISGjZ2sqQARUHlEW7XTyY0ln+sdx3YRFHmzeIhE5Qv9FOlro3cJaQd+qe
	 BQsFjijCLlbd4xoA/0JIB1dYo1nG/9KWt7b2ie1ewxWvme5a30e4Gvy9gAWyEiDtS5s4N
	 i6Sz1mwvW/XTQavaI1begfsc8Is1Tv165dCPnQBnBXieU2IWPsxOM0cxMph9p8Vi9ggoq
	 n6QYWAFbi7cLFqN0QatVNvvYK7y5ME+oiRDyT+NNQdBUgp1ZERxQf1tWPotB+2cYP0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DoJr4qMXXEkIc6Ayam64Ufv8co9xyA0CAfgw8Hg3JCY=;
	b=yKZCrmU5/2kDI83K1Ny47ZxGhY8PTfqAcNN+J/Ktjx3WD5AAU9yAwXwPt0U/xS1lslDD
	 9KBM+sm15UTM0lrT2nEEnw5EjD5nXk4IvWgD26H2BvKVFjyspTiVeOkZHu+9zkudl1DLu
	 HZm/oel77dHLINLaK2RSJmX385DeC20WE53WvG1dsrG5auo9r+Bxx0p8eWvgUPL4dqaS6
	 byhPQuV/liPDztNNHu8zb0PTrp3aq9SMZ3O4wJdo0w/O8cx0DjVsePHk29MLkAIHFfnhm
	 kuvac+3hoelYGQOdJ9W4FAlTWFMxGZumbMQpHpQUledUg6onwNv/1vNz+f8S/YMe9JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b="gzGI/Kfj";
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=N0RtDYfq;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fOumM+Vc;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9309606A31C;
	Thu, 12 Nov 2026 01:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9309606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gzGI/Kfj;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=N0RtDYfq;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fOumM+Vc
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMbcqw2518220;
	Wed, 11 Nov 2026 17:51:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=DoJr4qMXXEkIc6Ayam64Ufv8co9xyA0CAfgw8Hg3JCY=; b=
	gzGI/Kfj+89x5iBYr2eQVpLfIqt+DQ9LQCw82Fvo0mJIdnBOc/k9pzXCE4fvYx8d
	FHGehqyNcnF6sc+KgTxu3UDSHz8T5vun+N5EOKMm/HWM+1q9b5dELwZq0TKtOnDE
	ZXZMUEIKeMBFjU1I4PkNI3mWXJOwvZslHlv3zrvk2QRuuRSqW4/RGqrPb122eTJs
	7Xx7tZ/u/8Ecf9f2oVS/y9j1nZCqmokl8KR6NAlvSClGfO7NGihCYJXOkWa7f8Zj
	1i0Cew1jQLfbC/35/1tXO4XNyyf9t9WtI3uOs+sTz7DJtJ95xzos9DqjNwv6pXFh
	xPTRUDTiLy6SkkE9lXLOiA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hvvayu9be-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794448288; bh=DoJr4qMXXEkIc6Ayam64Ufv8co9xyA0CAfgw8Hg3JCY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=N0RtDYfq5WW1G/d90ipAI/Ys929qF2RbR2PCD6WtZeTZite8zzmYdxjwgB6Li5/1L
	 P+kJ4noDuN/GfMu/D2oeaEkORiummUX0N/3nPfECKXGRLN/OzqMhbVFS2UqaLqYb/a
	 i0ncLFnyuu182tfoSMMH9ZDLz5zRQuR9DVFCfYAzdY5QL5LEqgYlvoB6FGIsZXCjgO
	 506OA9HMyFbRNMz7PWWVkRgYhSrmy/w48Yr8DEjAK3wpPjibVgKP+W6TbyFdpoHJhD
	 b7A9M6d95uPYit57BhHsqATv+v0JfAlzU6G4+Fv6jHxzeW1nxxYEL2HdaSUEaStwnV
	 BRaaW4AwRtI3g==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1DA10402D6;
	Thu, 12 Nov 2026 01:51:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A6A12A07BB;
	Thu, 12 Nov 2026 01:51:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fOumM+Vc;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00102.outbound.protection.outlook.com [40.93.13.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 62BD92204A3;
	Thu, 12 Nov 2026 01:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APdeBfi0v7I6TBKoeBH65o0sLVN4o3XiBiryVofNyd2shGLACJeQhnIPwDerCxLCehGDSFmRvP52g5+Ike3lrZhkQZUw8dbeniEQRVA8CfpQQbhrVF32n5LKtQetAfeOGM4sB7H//Rjzjujjm7FDUBUFdOAevFF5eoUotXn9ui2LV0kxKYoSuduSmDezeXpztaAvB9/OYYfY5GwbT+D0AaRbwbkLb2udBiT5yTofvFSID91kSdHRDgQCdmd4PTA/S6tZDUu/toQICD7g71sbGAKCd8yYpNaRBEhj+bLaPeS+fpVXAxN0YnRnCDSxu/ec3n2hfI9gYGXxmSZnvvUruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoJr4qMXXEkIc6Ayam64Ufv8co9xyA0CAfgw8Hg3JCY=;
 b=hFxnO8zEbp63nx/N3zcvKMhCB2t+eZi6Kx2w4XE46VirrhcDXPKnx/fguJdw0BjCubmNmJ1l1urxR3FNevT/u/TBE8T2nJcULC7BUihyAvOBPg+CituZGTVRLxfH3HjItJfi+TI7cxXO5FazRp2OUFqFMTDsf5EVyEI59Wo2+iUZvOAppwb08lHYodvplQnDoW1XdtJnFFn3t4q7v+OcFfCyg/S/qrC6thWs056RNVzKhwAEkNW1lIz/Fv8hXEdDD2hCPJVlCSz8+A+d9Rn/VIleUXgSzZAClAmzYM+YChdF4U/SC/2Yij5R+/qIhLRca9sTbyCb9bqaP9oe779BJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoJr4qMXXEkIc6Ayam64Ufv8co9xyA0CAfgw8Hg3JCY=;
 b=fOumM+VcC9F1MY0mlJF0T+DgzkPYQd943t3K2B12fJzT2HMp6pfD+OWekFe7s3hZqrO2GTdEDzk1TX0z5J9xFv78YfBMwzDmJMR3IrTw/+HpA27IbkAaCD7ErduxF/xn+cFM0wshrInGtf2TIQ1n/6812Ut9wgtKKA/3hSxRDl4=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by SA5PPF7F0CA3746.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Thu, 12 Nov
 2026 01:51:03 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 01:51:02 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "peter.griffin@linaro.org" <peter.griffin@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jh0801.jung@samsung.com" <jh0801.jung@samsung.com>,
        "h10.kim@samsung.com" <h10.kim@samsung.com>,
        "dh10.jung@samsung.com" <dh10.jung@samsung.com>,
        "akash.m5@samsung.com" <akash.m5@samsung.com>,
        "hongpooh.kim@samsung.com" <hongpooh.kim@samsung.com>,
        "eomji.oh@samsung.com" <eomji.oh@samsung.com>,
        "shijie.cai@samsung.com" <shijie.cai@samsung.com>,
        "muhammed.ali@samsung.com" <muhammed.ali@samsung.com>,
        "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject: Re: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Thread-Topic: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Thread-Index: AQHdbR8+g8yc3lc/eUW03mmkuExNorcptkwA
Date: Thu, 12 Nov 2026 01:51:02 +0000
Message-ID: <avUbeyXCBd2BSXOc@vbox>
References: <20261105121401.1661711-1-selvarasu.g@samsung.com>
 <CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
 <20261105121401.1661711-3-selvarasu.g@samsung.com>
In-Reply-To: <20261105121401.1661711-3-selvarasu.g@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|SA5PPF7F0CA3746:EE_
x-ms-office365-filtering-correlation-id: 47c6ec08-2ed1-4c09-6a65-08df405f687a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|18002099003|6133799003|22082099003|10067099003|38070700021|11063799006|261102123227099003|56012099006|261021121427099003|261009223027099003|4143699003;
x-microsoft-antispam-message-info:
 WsLOMXCfekA5lArIUJtsQAOBj5UvXkwQ2Vrne3O4PrAePblQLfgW6+r3w30UAThVtPO1aismpcPL5CAID6t54cN1tLRy/heNKFh28CpcTY83IRN8j3u/P4Wzncrsu29Gu/DSI+m/SBT2NKYEzr7PKc3LWxAI4AMJ/ZU6ayUEJ4mRtp7NDuN7w6MdYSCX3zDpZu7/jhhWkbyHF5jWEwZ7w9TSfmGKi9a0cYEHjeBGL8jhVPDoxulien/7uuA89H5vkp8CgmE3MteZMb5LPHrFgIf9f5x9v8MTEszN9PS+u2Us2WqjzG4jBx8a7BYQTIMXUMpNeKeT/Nxr+h/J3/qpiMUMHt3oLUFJAb0+Y7l0taazSLjDEmGdX3SiN+EpKsjrXhAvPW1hWY5srrxSIW40VqlVI46q58TscLQzlE9zdFSQMTAZbFhHE7llcMZZ1LXLmfp2WYn73JhD3KGbOTZAItPSuUAtideWERZpI7DA5niQam0yJeL2eLzrJ0sZ9z47FBoKFvwre2QrE0aAiXOorQpUxpmnms9ATnMZ7yr1Aj/UQcCdpM0WyRHCZvELxc+klZZQ2yfTgdWqEpX+vyi/I1IWOA9q8LAlzlm0xDiUe+Gx6IA4IU0KtjJ7ENqwVvi2YWyzgkai0xt1so2d9secooyXHRdETUv5XQ6JTjBsI2Fsw3scyunw6rTx0p82tAObFTp4n+GvXW/wnV9sNOF4KsN98boU+Uf7sQPfrrjVplI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(10067099003)(38070700021)(11063799006)(261102123227099003)(56012099006)(261021121427099003)(261009223027099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjJtMXU4M1N0Q0NlRjkyKzFnRWI2QVRReGN0TGEybUpCYlJHekZqbFFmVmJr?=
 =?utf-8?B?VnJVSldTeWp3TElaZnFHMldiN2lsRnJjZ01iNWpzRi93eXlVa0NhR083SGlT?=
 =?utf-8?B?R3BBbnBCSkpITXVSV3djUkNmRHViMnBqdFBTTTMvS3NzaVV3Z2JtbE1Iem52?=
 =?utf-8?B?UVo5Ri9mdCtGdVVPOTRkKzhSMEQzZ2VESnRkcmlHam9scVMzQk9BQ3hwT1g5?=
 =?utf-8?B?YjhzaDBML2dvYjJHNW95RmpMVEV5UlFwWVVBbGlNeUFCZDN4ays4eVM2T0lt?=
 =?utf-8?B?d0tmWUgwZU1Wbnl1bjh5aU9BcXJDL3VYRTZ4VHBSZDR3NVQ3S0ZUcnI3UWIy?=
 =?utf-8?B?WFR1REFNeFl6QllEV3VCcjBkOCtRUlFzZjBTS2tXa042NGFib2V5cWZXY29H?=
 =?utf-8?B?c3JlSlZURmk4YXVqRXR4K2M4WDZ5b1hHYzVZd3hqeXA4UlF0Nks0M1RvMGR4?=
 =?utf-8?B?TDN3WkRSZFNiL0NEaGd5bjNZT1NiRlFrN1RuSlZXcFIvTmg1OHNaZ3BRYzNF?=
 =?utf-8?B?a2xLWUI1STBaSUcxYnQ2YWtoNlgrRGhpQnZ3TTMwZjlFZTR1S05CNjZ2RHNJ?=
 =?utf-8?B?VGhNUHk5QTZqb2FvanBqNGlkWDdGSkEza1ZkZURZN2g3UmJoKzZFTVNSSXBW?=
 =?utf-8?B?aFZEWFc4TEJnQ0RaeUhvdzBmRXNlc0tZRERIUVZGU2N3ZEVoSVNLWFovMmhL?=
 =?utf-8?B?OGFEbU1qUlZMbVhlSDJ1RzFQQzJMQ2lmQTRkMzdEWEJUUmhnN0haS0pDaXh0?=
 =?utf-8?B?aFZyWUhVTHNGWkt6RnJ2QU9YRlVpTW04MXBualY0RXVuVHV0ODBRRCtqeUpV?=
 =?utf-8?B?WDlneHd5WEtmL011cm1NbW1zMGwydTE5K2hVK2NMUk8wQlpkNEJ0YTF2WFJU?=
 =?utf-8?B?amUrd3RsMWJxN1dZd0tacGVvM1g1ZlErR0ZVVnpaZ3U4R2pLVytjMUlUajJq?=
 =?utf-8?B?RmV2WEhLSWJSQXI0SmhUVXJ2NFdsc2paOWVKMFR3V2tKNm5IVWVjWHJvMmNY?=
 =?utf-8?B?b2xnL0l5SCtpOE1icDNJd3J1UVhpYkRxZE1qZXYvODZ0WkNteTFjby9TN3ZY?=
 =?utf-8?B?OUZxK09oSjJVbFVucGIrUXFTenY0MEk4OW1kOU1YRGFuclV2NHFXcXlXUkht?=
 =?utf-8?B?WThPaVNaOGg3K2pBa1VCM3B0SXk4NEdSTk0wVjczNEo2Sy92SmJLWVJkQzdL?=
 =?utf-8?B?MGppUHZBR0pTeXBGd0lmaHpML1NCelk0dVVKV3NXWDFRbjgzbmYrdTV0MjhF?=
 =?utf-8?B?MEUrMkd6c0hqRW1jNlBUcHVEQzV6d3VpUG5FOFhYRnEwWDkxVUlFeU5xRk1I?=
 =?utf-8?B?RU5zZEVVaDRIbHBtOFp6Z0tVZWtpNEdoQ1JtR1AxbGZkVDB5b2x3NGlPa0Z4?=
 =?utf-8?B?RkpzRDVtQ2dNS292RDhaVmdNWHhZQy9QK3hsWm81VlNiUUQ4dThLRGRvV2N0?=
 =?utf-8?B?Y0RmZVB4R3AwV1gwTlloZlBjZ205UzdQRndSSjN6aFZwREFaU1J0Y0hMNk5J?=
 =?utf-8?B?dUR3SENuUllZVTFwemxTbTVxaXc2blJzbkJ6RGpnZ0tPNWthSHJXZ2VsRjk5?=
 =?utf-8?B?bjBIdFE4RVU5ZzluZ29ZUi95TndQVUt1akZYT2FDNDBjaW5zZ1FLeTJiUC80?=
 =?utf-8?B?TGFlS3ZoRTZOb3NEOUw2ek5JeENUblZENGxKbnNOVW5FOTV3R0FMSlZpelJ1?=
 =?utf-8?B?TDh4S0hwYktMd1lCYUhnVTRzNTZabkxNbHBXdTU0WHdHVEhLOWQ3NmNFQUZS?=
 =?utf-8?B?MTNwVFNoL3VxbTBCZGN2YThSa1k3V1Mrc0wzYXZjMTB4c3hXazJKVTUwRGxz?=
 =?utf-8?B?SUEwVnZuV3E2TzlPbTZqNkNEOS9kUWl5WERYelpwbzlQN1BFYTVzZGR4MzhZ?=
 =?utf-8?B?ZTlwNU5kYmRDMmpoL2J3Tmc3b1hoL0tFZzZ0N2h6b1huZURZbWZNUnVjMmZp?=
 =?utf-8?B?VGJKRzd1UDBPdHlXeFcvRjRWZ3RoMUhrbldKUm1RcmR4bGdmMEtxU3haUzRW?=
 =?utf-8?B?LzBDeUs4MnlNQWF6U2hWeEV2ZEg4TllNalZnOTkyTWdpZkRobzNHbDVSZ05U?=
 =?utf-8?B?aW1xbjYxQW5xRW5lZFVhbnlpb3lhQUlVYTBCK3YvQW94aDgvd0djSkFwc3hr?=
 =?utf-8?B?OVRJTUpEdlE0SVFoanlnSEliRkJ2UVBEelMyanUxRGlEWUtLUUxIelhhTnds?=
 =?utf-8?B?aHZGZVBoak5QMklLNlZyem03bGcxdlV4Ly9ZVjhzQ2laUGE4Q0hHWnFkNDFY?=
 =?utf-8?B?VEt4OFpsQ3VBSDZhcS9LdENsQ2NWNzhLcDBZeDI5TW50VTJLNzI0NWFKeUtT?=
 =?utf-8?B?ZCsxeTBsQmxmVmVIMy9JVEE0U1o2a3M0UzFTbHBIdlhadWtrVENWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEB1E8F1F3C09146A77FA6D38790A171@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cksnT1Hxqd/p2LpmXJmXpZNRalTvmCGA6RQLqztf9Ed38UaUZCL+AfFHKnKN7A2lT/50etOtNyCRbFDwNahtthJDaFM+3pteYduOLGMyBRNShH8sA+k9MboQb1EY4QtSlUiextrgx4EYCBGln5hhBeYNw7ZUEuRt/sA/l6VBj07qWJ8/azyLaYU15npbnHQKt7Xw+RXoA4pOGiRdXstaFIOJvSZ6ZlclI/AdFYUf5NTLLXgQn0dh1h9eWKH5BVobhkFD42F8djBhChruSQy98WkS3jlnxtQoWKl9MQgC6JfnjLTkWKK9MnvGWAbBCDSME7dJzGMs8f0UfLo2WwqtZw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xDg5R0MWYxw5LvfkOl1b/QyBy4i3TRdrhndn+WAYnOVn7bmPuMxGsCAEmQMHm8B+/5BXZiyOhTOJJDs7hbsEILJvKZHyV0lDMmQsROpfl7s7+QYGj5NTo2MFWDWOSGB39xMtNeyRQ6vC0ipXvhgjEirJLJiyjJc+Eywa74KsVYLKSguTd88/7qPattb1848DpQmMqkVQ0/7b869gFbD8b/oY9M5YkfTs0eNMhrGqZn+lQa3ImjRswFXwjVh+qJU6+JINA0FmlgjRSuOt+tj4XOejSYkOeD8eWXS//wogu3MHgRGxhN/tNWjAxjN0UmZ5jEr/rHY2U0gqAS4Vsk2Gyt25/55BaEF6BZW4WOAs56CQd47n7IY4LkMBx++zRJk5/mWvl0uT54nyy7KpZQN5bXO52MBkoy5wVOEOcdq9LkV6riVAbj/PirSGUNrzkoGfqKtuV8BSgX0yEihNB0WCFdWXfDhBFD3dN8m/oggjhsHyoBeQ62LPQ4f+GM5OgiyVifnmkJK+/uIyrbdZeKZhLHPbMU9fGtDe67kpo89aQ3+1Q/TKx9909ubU+H1LqSnJJ03MUJ/vYBF9G1h1v7VlBTpWevtuSVVA4R/opYy/bw/dR8l/ZjczV814rodN8/iz1ng4S6wFI8Bt8Bwkq96g2Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c6ec08-2ed1-4c09-6a65-08df405f687a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 01:51:02.8590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOJCRzef7RnwF/fEBNOtrhLNxnZg3TlS8YhnCmFLlJijpmT5Q9cg2xS3SBgpH4ph4Rq7oXwciWrhW2JbUdksOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7F0CA3746
X-Proofpoint-GUID: JWZJXVcbdRmE4QiYOpx_c7l4kDnJEsw1
X-Proofpoint-ORIG-GUID: JWZJXVcbdRmE4QiYOpx_c7l4kDnJEsw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNiBTYWx0ZWRfX8gIh+tzG0br2
 kIoz+2N5ebu8qwnl9MrZJsE7MOzqO/R1S9qorwDV6NtkbCP1HxQ6+lkHk+6cwwGaHbAyGpXifWq
 qYHSt6JQMBnCPQWI94HdR0+q7wsGDQS9xgMlh+PGXa0/u30MCx2lTnv18QNmJPJJr46EXoCSecS
 BfhbJ8JGcpxgnrDUeXkTBNDSERSDt4w69WPYsXJ5Ti0H3xGCdZgaq5/qHlkupD7IxHiE5jxciW/
 UILbCfPqWjP86CkWdOLA8P7MaQlINlQcshsS+ljQn2cLBBmezK9ta/ZMbh/kutq/WfYSMEmiG+e
 gYrRQk1P6pUlc48Nco1OgT8KONh2SBwxInCiaRpCJpPYq0hGI92YDljGFOUOYFlFa3zqg2kavra
 7n/Vk53aAty/69N4y0vemL9jTnbFuC7jKAIY88b3B60au/oI/28E40bTT0+DVxhAgQz34eYUgAd
 Mth6dUdcZitO3nPbbag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNiBTYWx0ZWRfXxzuwYN9cluh0
 Wj7RXYgM6J69PvLcBg5RUKhd//sOSHF3Zn6h7lEBZQHaVWb4deUAMipP7yT5RWOx/p3hiH81mKu
 mO49L0CxCcAI2lPDxM3aZ4qSLNNLgR8=
X-Authority-Analysis: v=2.4 cv=VNdIDNPX c=1 sm=1 tr=0 ts=6af51ba1 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=hD80L64hAAAA:8 a=jIQo8A4GAAAA:8 a=EW8qSjZtykoBiVUwo6cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611120006

T24gVGh1LCBOb3YgMDUsIDIwMjYsIFNlbHZhcmFzdSBHYW5lc2FuIHdyb3RlOg0KPiBBZGQgdGhl
ICJzYW1zdW5nLGV4eW5vczg4NTUtZHdjMyIgY29tcGF0aWJsZSBzdHJpbmcgdG8gZHdjMy1nZW5l
cmljLXBsYXQNCj4gc28gdGhlIEV4eW5vczg4NTUgRFdDMyBjb250cm9sbGVyIGNhbiBwcm9iZSB0
aHJvdWdoIHRoZSBnZW5lcmljIERXQzMNCj4gcGxhdGZvcm0gZ2x1ZS4NCj4gDQo+IENvLWRldmVs
b3BlZC1ieTogTXVoYW1tZWQgQWxpIDxtdWhhbW1lZC5hbGlAc2Ftc3VuZy5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IE11aGFtbWVkIEFsaSA8bXVoYW1tZWQuYWxpQHNhbXN1bmcuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTZWx2YXJhc3UgR2FuZXNhbiA8c2VsdmFyYXN1LmdAc2Ftc3VuZy5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIHwgMSArDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2Vu
ZXJpYy1wbGF0LmMNCj4gaW5kZXggY2E2OWFjMGViMDdjLi4wNjliMjY1Yzk4MDggMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gQEAgLTIzNiw2ICsyMzYsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd2MzX2dlbmVyaWNfb2ZfbWF0Y2hbXSA9
IHsNCj4gIAl7IC5jb21wYXRpYmxlID0gInNwYWNlbWl0LGszLWR3YzMiLCB9LA0KPiAgCXsgLmNv
bXBhdGlibGUgPSAiZnNsLGxzMTAyOGEtZHdjMyIsICZmc2xfbHMxMDI4X2R3YzN9LA0KPiAgCXsg
LmNvbXBhdGlibGUgPSAiZXN3aW4sZWljNzcwMC1kd2MzIiwgJmVpYzc3MDBfZHdjM30sDQo+ICsJ
eyAuY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczg4NTUtZHdjMyIsIH0sDQo+ICAJeyAuY29t
cGF0aWJsZSA9ICJzdGFyZml2ZSxqaGIxMDAtZHdjMyIsIH0sDQo+ICAJeyAvKiBzZW50aW5lbCAq
LyB9DQo+ICB9Ow0KPiAtLSANCj4gMi4xNy4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVu
IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
