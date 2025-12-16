Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C83B30E0F8;
	Tue, 16 Dec 2025 23:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765928116; cv=fail; b=Hh04SVGsYlfPHN+XkYtT6N5aiJk6VLO85JpF0V5DUmzffZSmvMr9oIv+M0g5wmuOptpAxdRxRsS1kZ5as3vgPeQG0QK9r4hoHeI6lkE0Y0EjQybrB1PF6oJnpYH8zia2V1U3kst+yowa4+87cfAA3gY7Wr1fopt/aFTonetfaSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765928116; c=relaxed/simple;
	bh=jIDcRPI2hmTsPP7o3JDpsW914jckeksyibDHTYWBhvs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B5/XglOK2b/UuW2JC0ofRUFrPXtP2k/Rp5uOpEPwA7FAf4fTiEmn4MXtaVi7UObB7fVzqwmOXHFSbtC3Ibxw0UwHjdREVA3QQdy2YEl08A25d4tXnPuvPCbRD89q4FL+l3B4/SEyRThXJ0izMg3vbfEfy7TFbobqNa70kIS+qd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=j7/Do9cW; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=efskyuM+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sXr8tQ1T reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j7/Do9cW";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="efskyuM+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sXr8tQ1T"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGLj8M72513212;
	Tue, 16 Dec 2025 15:34:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=jIDcRPI2hmTsPP7o3JDpsW914jckeksyibDHTYWBhvs=; b=
	j7/Do9cW/y8xrRoHcGQV27U9SeEaTXDHK5jO+uOmrR0t7WwNLUzMBa8usgTum1SS
	+SdISfKfQPz2A7+UkpxQkMS3cHc5jT77VcJs+gIvEZswNLx2HYu1kmNLL+TFzOT4
	RqSFoCMKY8smKraEUC68hvCMkzO6v+C5BdnQNkU0fdBud0pmBc5EI38bDf/n53bk
	FO9R6mBS39c0t1nuvTVPvOYWyfdC+PdaKFKedXNWJreT2OpRhTL4g6uBBlmWdjs4
	bCzyRWNv11qMC26XqKKhux4y1tjAr9VFyQxcxb2lQ7dN4aYcszXHfuWoTGva4uSj
	61cuh3AGr+oCntwPMxN3Uw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4b2v0h5h8s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1765928086; bh=jIDcRPI2hmTsPP7o3JDpsW914jckeksyibDHTYWBhvs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=efskyuM+zd0+nl63oAwmGi40HBtSHsfDsD27N42B86VvbjizZeRi0zYbO8WKYulaS
	 ziUZua9K1sqnHDTk3OVrBEnRSyLdhcazAQxDnVtGIVEvWiCZZZCYGZiQsgmUjhAdhb
	 mFj3UWYIy6CfC+nLK7G4tc7XYJgBtTZXI6IpJhgsxyX1/at9qvR7ZVpUOKh7GBi6Lr
	 opKp40nhGh636f3Q/4CQ1/9QDzV7Wbu/WcE93eXNeKijF20qOqk2+UjW2D8FcRVpe6
	 zJ62nyP5DYNJFJrjEK5YEckJ5kyKMMincM6joTlwUEIxdytUVZZ5oebfjqhQKBJGz+
	 aT9z05qq8u1Cw==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B0C41400FE;
	Tue, 16 Dec 2025 23:34:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 487EAA026F;
	Tue, 16 Dec 2025 23:34:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=sXr8tQ1T;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00402.outbound.protection.outlook.com [40.93.13.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9496940235;
	Tue, 16 Dec 2025 23:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmB/JDpjUZfy7Fgm+UaJVzhcXslPVaDmXRsaFUqP8NtPlJM+mLXDODyBsannMYhDaJpeJivpjiyVwsJkx7sB/HHD5P5bB0JcfIjh7nUsavTCnWaI2vz9swTWbyOUhkTPfMAfkYmqQw/eDfzrpl3Ofwj2fPWfqN+vdXB/CFc/8UY5qOEE2pAGASPoHP3XuceKi+fq06dspfLeAEBiLZfv4nS/uSeov1JVbiQchCxjV3JxCS5sfxY7o2/lNNZCVRG1kJol/Hk12Mc6kAwvcBUK+QoXd7FLLlx8sonGgtF0mn3YNI2I/2G9PBOVFsQpumFmCfpdCG2sZqd11O82HlSuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIDcRPI2hmTsPP7o3JDpsW914jckeksyibDHTYWBhvs=;
 b=j2Ao3RCXiskWGVqwFwiW+4TIqfsjkDUwWKW/qfBT8smoYzYQqBjNV0PY1J+fiwe2f8CAi7vNuiOVV5jUQm3gxM9ypGx7RadSRXdgXKRDs0f0MD/P9BWUJprpn/P/FZL41m3rlI5U5JngI00+gM361Y/pTW9NDzDHzHVIjiYqKGwnQVCwEOrzCZkd3H2W6i0vrYfzjk+Opv6+PESmRIT8xK+r+DL6cg/EOnrX+chAgfuc7tZh48OVd8oQbv9BxwPQ7cULP3fotAbrEcgs9AkSQcvwWE50gMaytV74MG+zlItM72SOoEVxCsEmK68iVMuUQwSvyM/0vTx/6VP3GeNGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIDcRPI2hmTsPP7o3JDpsW914jckeksyibDHTYWBhvs=;
 b=sXr8tQ1T6IITSxGD2uV89OVHL2f7BzWYyWAYVBuEz1t1Ry06Nd51+UaNcmQegMQfCCw6JOk2gpO/thv/YoeQYSKwXfm65dM62hQYi2drq9e4zBYaxNTJOW8MUbXYO3K1JxGzLCD7b8FjStvLbE7H92wo6SlxjLOr446aASQRuA8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 23:34:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 23:34:41 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Doug Anderson <dianders@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        Joy Chakraborty <joychakr@google.com>,
        Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Topic: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Index: AQHcZY6s6Hd5G5N0JUKUymoHv43gerUSjywAgAATWYCAElt1gA==
Date: Tue, 16 Dec 2025 23:34:41 +0000
Message-ID: <20251216233439.vqigcx2zs6taergz@synopsys.com>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com>
 <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
In-Reply-To:
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB8224:EE_
x-ms-office365-filtering-correlation-id: 7d5df5e6-7e70-411d-c3b5-08de3cfbafba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SHZHam53OFMxTU50UnpHN1V4VnpKOUhxaUllbGdRNHJZWWlDTlRWZTh2MVpr?=
 =?utf-8?B?b2RXQ0pMWTlWMjY5SVZ5SktGY0hYY3cwNmxiWDk1SzB1UERaNkkwTEN3b01D?=
 =?utf-8?B?RVNrZUZSenhDYXNRQ1BtcEpsczJqL1gyZitNbGNuNEVyV1pHVTIvVzRzZ0Vm?=
 =?utf-8?B?bWxmNHZCK3RJRnNFSktkUlcybXZ4L3hiOW5pWlMvZDJybXo1OFV1emlmVWRZ?=
 =?utf-8?B?bVlvYWVhRHBsUlhqWXo1NHVPRW1PZStPcysvS1h4N0NabkV5elZpYnh1bEgr?=
 =?utf-8?B?SFZrS3FoVExoS2R1OURtZW0xL3N6UjlpYzc5a3pyWTZmNWN3N1h2WEpFcG5P?=
 =?utf-8?B?cW4yTnZETmNnTkh3c0JNK2pUVXRLTzJsblJLVGhleWhIM0tha0J2anhhY3c3?=
 =?utf-8?B?U01pN05PTHVDR3BkY0lkTDhENkxWUUFocGgxUkl2YVVGMlFkRlpuQnd0eVBO?=
 =?utf-8?B?dUx4VS9kWm9ybmt3S2IzbDFiWVB1cmtyUSszb2o4WCtDV2RQYXk5a2RaSkFZ?=
 =?utf-8?B?ajRNR2FRMEZTajhPZzErNlVTdVJTSXFOMkNaKyt5N050R1pXRmdFcWkxT1ZT?=
 =?utf-8?B?NVcyMXJEY0FvMUZCd2pySGtYK0lNa1dzcUovOVUrY3dlaWNSd001S1NDWXMv?=
 =?utf-8?B?cFJvc1RpMVhNeDlDTlZaYW9sUmRneWlFYkVweXJPaG1BR1p3RUNGOTJud3JX?=
 =?utf-8?B?WlJVU1JCMUFjdmNyQUV6WGdtK2VPOFgvUndZWkhKMG1VMU5SZjFWcFRpT1lk?=
 =?utf-8?B?NzBQUkM1dWJjTWRnRytBdkNKNWdRS01Od256a1dkQWhMK1lzdUlKTUJqR29O?=
 =?utf-8?B?VHFZdTcxRUJhVzZXeENmeHFyaTdTRHBxc2JKaG9LeTcwYUxXRkQzQjdTRVdO?=
 =?utf-8?B?ZFZ6aDJLbTJQUGJYaExDdXI5azF4cXA1YkJVT3BNdkVRckZSZUFEcjF0SEtZ?=
 =?utf-8?B?VkphY29CclJ6WkliR1JPd1liVmZ4TXlGaWZEVFNIVXdkNVBRbjZ1YWRPRXg0?=
 =?utf-8?B?SUJMak5wRlFXdzhQWndqbTI5N0k3bmtuN2VIamdUUnQ5TDliaHpKYVVoOGlh?=
 =?utf-8?B?NGg0TktqYzBlTGhoKzU1bVFVcnNSTFV4cEF2NVBtVXV0dThQQ3BzYmZzZWF3?=
 =?utf-8?B?QjJaYUpoQWFZMXRYYzNoNDl0NE5FRHZUOTljVnE5dnVBTWp3WlVkUWg2WklX?=
 =?utf-8?B?Tk9keTh3WTdPYmNqQnpSK0pRMzNWNTFjdVRNak05WkUxS3BDV3lrVzFyRXRD?=
 =?utf-8?B?RHZ0Y2lnNllYaUJXZ1ZhMnlic3QxQkt3dW5nR0VmVjNoOG11ZC9wTTg0ZjZT?=
 =?utf-8?B?aFhyQ3BmZEdXSjNJa2pzK2xpcnd1ejRSRXdQV1NvTXFLRDFqR3hvQXdqYjlH?=
 =?utf-8?B?UEE1bUVoV2NIL1N3UGpQQnljOTlhalpoTzlrMkt6cWlUK2ZFenhIREdISzFL?=
 =?utf-8?B?OXFiZXlybW5JcE8rWDh1aENPK0wvakpLYkVhQldJdTZkMlBiR1h3M1YvMmZr?=
 =?utf-8?B?OTRmcm42ZlJzbzhUVjFoN1gwbEIvZkxFZ0E2YTRDSEZ2MU9PSFkvWVNiZGRP?=
 =?utf-8?B?b2NLSGhHYXVhbEVoZU5aY2tXUmorMmw3OElTOVllczcyeTI5dElMUzY5Mm1q?=
 =?utf-8?B?SERlR2kvVTZnVnpRaTA3VkEzTWxqR1g1NTlBRlZyeXJmRVNXb1BHUGFZTEw1?=
 =?utf-8?B?eE4zZWhScUJseWFJVVBrZFdsRWpwOUM4TGhCK05CNTVsaHo5M25QZkx6dEhZ?=
 =?utf-8?B?MDlxeXh0U0tqL2sxb3dZN2txTmtiSHRvcG5UcDJrOU1Ob2xhZkhrSWhKWWw0?=
 =?utf-8?B?YlNyWUN1alBTNUJBaW02T09ZUWdOUzczdDkzSHM1Qk5BUWZTc0p2bHVOUnNv?=
 =?utf-8?B?bU9Bd2IrMHo4UUk4c2R1YUlucHRoZEx6QkxLMzY5OVZibityeE53QTdwV0JM?=
 =?utf-8?B?RUhZQnQ2NFFoN0lHL1QwSWs4YzBvbGMwbnFuRTZvNnhpV20xOXg5SGhTaytt?=
 =?utf-8?B?eEEzbmpWanc2ZWF2SCtySDJwaGtPajlNRkZ2Z29TaWVJeTg3RXdGb05FaEpi?=
 =?utf-8?Q?dNbQRl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WW53cndQM2dPajFZaWhoVSsxdWZtNkgwamVHSzBBSk53TDFOQVQ1UjlzUWdq?=
 =?utf-8?B?QVBObHdQbll2UndQM3Z6blhHTTl3UVFiRnBBMWczNHJUZzdTZll3amkwZzV6?=
 =?utf-8?B?VDAxY3dGUzlETXd1RDdOMU5DTlFXVW1OQTBESWdxZ1JuTzlFa00zNklLRWwz?=
 =?utf-8?B?RDcveFBXNjc0MHRGTGc2ejVGZmpTQjhqRG04S2tYSXQ3ZTFYeDVaK3NmeUhF?=
 =?utf-8?B?UXpkRitYRTY5ME5VbXJrRFFJQ2pZVDVJTDBjdllrYkRGK0graGJmdXExQW1s?=
 =?utf-8?B?TExxM2l3VzJTR2U1SGlzanRkT3ROWkVnZm92bHQybGhmOHhsRFJXZVRuMXFD?=
 =?utf-8?B?L0ZLUTdOUWh2cXJaUW95VkJxaDlURjB5SXVsSll0MXFJdm5HWi93dkIydnF0?=
 =?utf-8?B?SWRnTllqcVgrS3FpV3NvcEdhN2VHNWYydE5KWmJrUnBIZXBwVkJKbDRFYUtO?=
 =?utf-8?B?MVlmVjNOOURKb0V0YWNZV29WS3NPZGNJNmhRZk9LWjVTQzdXcmFxQWEvR1d4?=
 =?utf-8?B?K010RmJ5TmNtUURBK1dmLy8zT1JBbVRxV3JnT0YyRkZsdmJEazRLMlkxMWtG?=
 =?utf-8?B?bFBHUS9uSFM4bzA0empHOUhoUnI1NkI1bTNXNnh1cVFCV1Y2em4rRCs2ZC9h?=
 =?utf-8?B?azZ2TVdNbUl6cjd1RUIzNkhYZDV2Q3VKM2pwQ0YxQmN6bHdaMWdhZEY2U041?=
 =?utf-8?B?OEJhK0t3VEd2Ny9kRnY4M2tOZjh1Qkc2c0dvZUhjV0tMS1ZtblFHcFlIUS9D?=
 =?utf-8?B?ZHZyR05oT3ZkVGRKQkNRSXVvVVQ2Y0VQeDk4RTVnellUOTVJZ3pkUzN2OGFI?=
 =?utf-8?B?dTkrZDRqL1NMbWd2Rit2NW5QYUJOak9iWlVvclhLM1JseTB4VGtQb0lWZmQ5?=
 =?utf-8?B?WllZQmVkOTAzWE1uNFBUWWdPQk5la1VKQ0pCOWtJYzh5aUhtdHFZcUF1ZTZX?=
 =?utf-8?B?cnVrakNWYmd2WGdGL0ZuNnIyNWpvMDRldUs5ZzdpOUQ2cmpsYmhjSW5YdUdp?=
 =?utf-8?B?WDhVSitYWitzakxvK054dlZWemRuZkRTeXpWbjNZS0swN1cwTFlIRHVJakx0?=
 =?utf-8?B?TzRCdzBtaXltRXhLQ2pRdXRlMXBYcE0xZjFONUV0ellsbUJoR2JqUk5TNkJn?=
 =?utf-8?B?cDNodDJBQ2ZZRHI1RWZXSmh0aUE0L0Z3YjI3dHJPbEVuZmQ2elZodGkyVGVx?=
 =?utf-8?B?N1JrcXlwZ3hsMVV6eDVSMjI0S1UyaVdnRENTWjlpSU4xYXMzQ2lyKy9LWVB1?=
 =?utf-8?B?ekNKV1lyRGNzLzM5ZGVXVXI2bk93MzBBdHdkdWpMc3FPSXNORU1ndkJhQXVN?=
 =?utf-8?B?NitDT2hISEE2S0ZrOGFPWDJPeFZaRHRkUHJpWjZpVHJxN3NaT29SZjE2T3lZ?=
 =?utf-8?B?dU9jdlFSbWxWcEphazVaaGFxN2NpNStBRlN1TTRoK2RzYUdOOCtjM0VHNzJ5?=
 =?utf-8?B?ZUt0ejFKN1VId2VaOGtQN0NIQlRya3I5ajlObmZrck5xNmFvVEVXVlhjZU5T?=
 =?utf-8?B?elZJK0NPOHVjaE5JdXM3MW1XM1NRaDc3ZVorNHpQVXdnN1pzRHpjVHllK0Yr?=
 =?utf-8?B?MXcxc1pLcDNGWVBsV2lvQ0ZkZHRmK0J3MHNNM0ZKYnhKYm85TDRUbHpFQmtD?=
 =?utf-8?B?WVEyeVdlY1BaUmFNZDdSV0JNM0dXOTY2MDloUWQ0RG9jblBsUGFkM092OUtv?=
 =?utf-8?B?czM3ejh4UWNZQmtVYmtWMEJpWGtCNXRUeGZFaFNVaFBlcmh0dlYvTTlmTlc4?=
 =?utf-8?B?SnplTnNLdU1nRHoxMGZmM05NZXl2bU5kYWF5a1ZBdlBlVVlPS2NxcU8zcmQw?=
 =?utf-8?B?WlFmUnlCV2VEUkZtN29vRlFMQ0NPVlkyM09oQ2Nxb1dpQ0JiNGs5VkMzajlU?=
 =?utf-8?B?UWQ1cTB3bm9hVWxxYmlxeWw5ak03NDB0U08rL0RmMVdhd3Q4S1lzdEFYQ0Zi?=
 =?utf-8?B?QUU2VU5qdE5EejdHcUdEY3dXaThLMGo3SmVSeVJjd2tYeUlkUUF0cnRpMmJI?=
 =?utf-8?B?SkRhVTdaMFNHaUxNTC8zSE4yUy9sRkZFSEJMOW81cFNlT3RPRm5TVmpCbXJu?=
 =?utf-8?B?N21NTWY4eFhFUnExakV1cHcrY2F5RXRlbk0yYmcvZGdEekx5R2JBMzUyQ1Ny?=
 =?utf-8?B?SkdRaTAyZGpUVkZJeWl5QzJTdDRLSWJJczM1UlRmekdxQnFkNVZUYWNNbkI3?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16B23E8A25CB52448619D719E72018C0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DtzxhadoUL18GIixALVESS5NxrvFL6GmK243yHmEeCeaJZnTmfrf4NDVK07vuVHwcw2MRwBOqx1ZxVcthnIfxYtc1HAMKLrRMJ2evEoQGkke0XK/7NBawFYlKE/4hGW2C1dtyRQUkZixxC6rkNI57dlRLgIL5QhIgUF1O9sJNZFqCeU+Pzq1O+g6YvVnexfTg9YnFRZdPckx/zuHIEYxYiQdKRGB6KeWOU27y2ww/F3WlJ+M46bUDvvDiz0H283XwHS7wa6LqIPVt5DNXn55STKO423j0mrmtM/+c51pH0qMduGQ4rWlitq6osW6XiOePal4Q2Nf0YNr/gxoVscPGN8Filq0uZaiM3p4BCYJY6fhwGpNH7KaljzzFni7nYeZ04BUiNqOxr+7JB/40h4u3esEVwPb/m15hGkGdgqvpPMAOqIBtz6c7RYhLE5XXwpsBqpPhWuaC6B3nEs27lc3xVKsJChsm8oc2fFm6Lr43uV+VaAFR94dbxSZ0ACBXVNLTsRRBmi9canl4f5VSrbRTmj202tKWyKtpdMN5EjPLFsDmmvn4TkRUOU2LBHN7KyTj01GAhFXK6ioopKO51ETotWQKy3qMdWJMEs0dC2+X8Wa8nkt5Em/bFMes7ywXZjpyIWTJPCNy/qiLSG/uZYSLg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5df5e6-7e70-411d-c3b5-08de3cfbafba
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:34:41.5547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhyYcQRwp3MfGcbRg/L43JFXwwMcLb4xkBlxEXcWPSGcOSTUgO0OLsON0r4CN2jm5d9KUHCpXp+BFWTwdeg2Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
X-Authority-Analysis: v=2.4 cv=bp5BxUai c=1 sm=1 tr=0 ts=6941ec97 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8
 a=f9cninhy65_q4H3wYBsA:9 a=QEXdDO2ut3YA:10 a=GHzZeaHGQcwA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: BKzwIF5wr9Xez6vaUuhiBgVsUtJtTBZg
X-Proofpoint-ORIG-GUID: BKzwIF5wr9Xez6vaUuhiBgVsUtJtTBZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE5OCBTYWx0ZWRfX2TC+gM2S4l4w
 7fI8KVNy0hMMWmpZDYX1wPLdWXRkyjKznjNIS6Khroy5LFGnQb3NyQcOec1AiOxVacDLw1KiNs8
 ZjH0zODJXNqKFLlKHdBr8PBVZ9PRFOl27TM9aAi/sQgXPDXhlWA4/aj8lnzSBdtatoUPTfvgsIP
 kQw/gOZDWddu+TVP/JbNzeWZ8zAv4TJjjNBrN0KDg/HuUPQFlj1MmUzxH3fHgLx+cLRHHUh4a6D
 HmDSS0HFRpU0mmfrKk4kGLWPoTqBGCBc1z6VPo45xJocnRSt0ESi7rDyxc+z0fcrbyBkc5+h8qa
 J6Ca4OV+wjfCYG2P1bYd4c2jT7rQEm2AuAOF1yv4TbkWPeDhTdnqVPQxgT9Nxjm6PP7jXL75JLp
 Nc+SDory7RCdDDKFZz7vf79Uuwq8FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512160198

T24gVGh1LCBEZWMgMDQsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IE9uIFRodSwgRGVjIDQsIDIw
MjUgYXQgMTA6MDXigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4NCj4gPGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnPiB3cm90ZToNCj4gPg0KPiA+IE9uIEZyaSwgRGVjIDA1LCAyMDI1IGF0IDAyOjI2
OjM4QU0gKzAwMDAsIFJveSBMdW8gd3JvdGU6DQo+ID4gPiArY29uZmlnIFVTQl9EV0MzX0dPT0dM
RQ0KPiA+ID4gKyAgICAgdHJpc3RhdGUgIkdvb2dsZSBQbGF0Zm9ybSINCj4gPiA+ICsgICAgIGRl
cGVuZHMgb24gQVJDSF9HT09HTEUgfHwgQ09NUElMRV9URVNUDQo+ID4NCj4gPiBUaGVyZSBpcyBu
byBBUkNIX0dPT0dMRSBpbiB0aGUgdHJlZSBub3csIHNvIGhvdyBpcyB0aGlzIHN1cHBvc2VkIHRv
DQo+ID4gd29yaz8gIFNob3VsZG4ndCB0b29scyB0aGF0IGNoZWNrIGZvciAiaW52YWxpZCBjb25m
aWcgb3B0aW9ucyIgdHJpZ2dlcg0KPiA+IG9uIHRoaXM/DQo+ID4NCj4gPiB0aGFua3MsDQo+ID4N
Cj4gPiBncmVnIGstaA0KPiANCj4gSGkgR3JlZywNCj4gDQo+IFRoZSBtZW51Y29uZmlnIGxvb2tz
IGxpa2UgdGhlIGZvbGxvd2luZyBhbmQgaXQgZG9lc24ndCBjb21wbGFpbjoNCj4gfCBTeW1ib2w6
IEFSQ0hfR09PR0xFIFs9QVJDSF9HT09HTEVdDQo+IHwgVHlwZSAgOiB1bmtub3duDQo+IHwNCj4g
fCBTeW1ib2w6IFBIWV9HT09HTEVfVVNCIFs9eV0NCj4gfCBUeXBlICA6IHRyaXN0YXRlDQo+IHwg
RGVmaW5lZCBhdCBkcml2ZXJzL3BoeS9LY29uZmlnOjEwNA0KPiB8ICAgICBQcm9tcHQ6IEdvb2ds
ZSBUZW5zb3IgU29DIFVTQiBQSFkgZHJpdmVyDQo+IHwgICAgIERlcGVuZHMgb246IEFSQ0hfR09P
R0xFIHx8IENPTVBJTEVfVEVTVCBbPXldDQo+IA0KPiBBY2NvcmRpbmcgdG8gS2NvbmZpZyBkb2N1
bWVudGF0aW9uIFsxXSwgdGhlIHVua25vd24gc3ltYm9sDQo+IHdvdWxkIHNpbXBseSBiZSBldmFs
dWF0ZWQgYXMgYW4gIm4iLCB3aGljaCBpcyB3aGF0IHdlIHdhbnQuDQo+ICJDb252ZXJ0IHRoZSBz
eW1ib2wgaW50byBhbiBleHByZXNzaW9uLiBCb29sZWFuIGFuZCB0cmlzdGF0ZQ0KPiBzeW1ib2xz
IGFyZSBzaW1wbHkgY29udmVydGVkIGludG8gdGhlIHJlc3BlY3RpdmUgZXhwcmVzc2lvbg0KPiB2
YWx1ZXMuIEFsbCBvdGhlciBzeW1ib2wgdHlwZXMgcmVzdWx0IGluIOKAmG7igJkuIg0KPiANCj4g
SW4gYSBkaWZmZXJlbnQgS2NvbmZpZyBkb2N1bWVudGF0aW9uLCBhbiBlbnZpcm9ubWVudCB2YXJp
YWJsZQ0KPiAiS0NPTkZJR19XQVJOX1VOS05PV05fU1lNQk9MUyIgaXMgdGhlcmUgdG8gZGV0ZWN0
DQo+IHVuZGVmaW5lZCBzeW1ib2xzIGluIHRoZSAiY29uZmlnIGlucHV0IiwgYnV0IEkgY2FuJ3Qg
ZmluZCBvbmUgdGhhdA0KPiBjYXRjaGVzIHVuZGVmaW5lZCBzeW1ib2xzIGluIHRoZSBLY29uZmln
IHRyZWUgaXRzZWxmLg0KPiANCj4gVGhhdCBpcywgdGhlIHRvb2wgc2VlbXMgdG8gYWxsb3cgdGhp
cy4NCj4gSG93ZXZlciwgaWYgdGhpcyB0dXJucyBvdXQgdG8gYmUgYSBtYWpvciBwcm9ibGVtLiBJ
IHRoaW5rIHdlDQo+IGNhbiBlaXRoZXI6DQo+IC0gUmVtb3ZlIEFSQ0hfR09PR0xFIGFuZCBsZWF2
ZSBDT01QSUxFX1RFU1QgYXMNCj4gICB0aGUgb25seSBkZXBlbmRlbmN5LiBUaGVuIGFkZCBBUkNI
X0dPT0dMRSBiYWNrDQo+ICAgbGF0ZXIgb25jZSBpdCdzIGluIHRoZSB0cmVlLg0KPiAtIERlZmVy
IHRoZSB3aG9sZSBwYXRjaCBzZXJpZXMgdW50aWwgQVJDSF9HT09HTEUgaXMNCj4gICBwcmVzZW50
IChJIGhvcGUgbm90KS4NCj4gDQo+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9kb2NzLmtlcm5lbC5vcmcva2J1aWxkL2tjb25maWctbGFuZ3VhZ2UuaHRtbCptZW51LWRl
cGVuZGVuY2llc19fO0l3ISFBNEYyUjlHX3BnIWUteTJfQnNTTmhYRjF2NUs2dEJKWC1PYWJnS0pN
OVdWZHZ3eUtvQjZ0Zzlvb0NMVmc4V2lRNFVyU3RPRjJZWlFfWnM2dEM2SFZoN3dDcHFrRWZVJCAN
Cj4gWzJdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9Eb2N1bWVudGF0aW9uL2tidWlsZC9rY29uZmlnLnJzdF9fOyEhQTRGMlI5R19wZyFlLXky
X0JzU05oWEYxdjVLNnRCSlgtT2FiZ0tKTTlXVmR2d3lLb0I2dGc5b29DTFZnOFdpUTRVclN0T0Yy
WVpRX1pzNnRDNkhWaDd3SHBvVWxoWSQgDQo+IA0KDQpIaSBHcmVnLCBSb3ksDQoNCkp1c3QgY2hl
Y2tpbmcsIGFyZSB3ZSBhbGlnbmVkIGhlcmU/DQoNCkJSLA0KVGhpbmg=
