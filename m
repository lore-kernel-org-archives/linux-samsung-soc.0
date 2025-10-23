Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203E823C4F3;
	Thu, 23 Oct 2025 22:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761259439; cv=fail; b=T60Ce6YJvI0vY/WlffSYHhMftbFWxDAqalVoWUw/AMLASPJqSjY4RSw56MpZGvgoFdYZU99MMLmfJgb56ZiuxZ5CpYvP7crZ0EbNs9Mi59vJeGVAFkxJ8oEruffv6EUTAURHCrXtoa31QRrPd75wV913tkENxXz/WcNl8Rr3clc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761259439; c=relaxed/simple;
	bh=GqZAUN4uQ+UXu6qqddZexXLEc5dm0iIyfjnVpTR/qaA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D8LltmszSN4dailzXvD44TLAnijpZqxLLgiptbodMLIM8aezYy8JidSYw7Y3/SAe16QIS4WvP9cEPHruimJLZCX7Q9TdAn9YfboHJs//mUt9Z0/4xak/tQqnUADAWKrQ3/8vEyiHMiRHMQm9A0ZD9O5dZwyUENTV4qW2HC4WIn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=unknown smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nQXytL1X; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ccbRQnbz; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jcJDolwf reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nQXytL1X";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ccbRQnbz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jcJDolwf"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NI6DHQ018607;
	Thu, 23 Oct 2025 15:43:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=GqZAUN4uQ+UXu6qqddZexXLEc5dm0iIyfjnVpTR/qaA=; b=
	nQXytL1XdWmIHXKge/szUmPjsE0DZg0o7B1w+VB96WHbu6xp2k+TMQu7+J4hkmAb
	3iJVX63lKUVuUCVySGeSpFvZWeov5Rqg6RUoZcFEbqfkkFk2cn3A4k4yhNsMvlkG
	7tsorZNlMiHEDBVVaVvMfY9Mv+1slD0CR9xlOS3aAD0wjaf9ZaSPkyeNItQLuZVm
	J5I4FSr98B4JinXXO9umo+li6l3slwgUP6UV7PlW8YrLVtS9/S11EV2cz/aMPYEl
	Fh8zgR4bEs/o4SlwPXQS8TsrqwamfhPT/E93DdsdNykv/lAolMgRund9EZVn+VoB
	fyl4IwVZrk4bQ59siLCrBA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 49va555bad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 15:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1761259396; bh=GqZAUN4uQ+UXu6qqddZexXLEc5dm0iIyfjnVpTR/qaA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ccbRQnbzbJ8QzEUFrGstvy2u3uRV3RLS4DXnsamvEtiOgTKec49rItUU4XCh0awfh
	 gWVw2i3G+6vr2SSz/duKMw0g2zc0NAK2FC7GDGOUkii3/BU74OsK8M4FhMccpqXF5U
	 wMS9pXWm6hY3z2LYmpuqvRIWZLQ7Om9lZsM51pIF4Up3qn1lVuGtzAjufH4aZRG8CA
	 nqnQVqvo4e1f4z925eIs/T+19rkVDfbiIxbWI1oB+Xgnfp9RVQolFSEIO2rLOZEVrs
	 DApKXlLHvyKO54xBKbwBhrOhJtVFszRNQmDyRFarUMsXuwcWNghXF5McQvFXB2w94w
	 fSjp19mqc04zw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E73504048F;
	Thu, 23 Oct 2025 22:43:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id ACD35A0079;
	Thu, 23 Oct 2025 22:43:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=jcJDolwf;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00103.outbound.protection.outlook.com [40.93.10.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8B4E22201A2;
	Thu, 23 Oct 2025 22:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKxRE9HINdIkLcgg+CmEvYVhcaCRf+aD6GgBy4uchbDPxoDx0mNRbIBS3Lwt0vF601GvNj99Nr5LTLU1FzCKabGV5ij9Xd2PniJ/GVcyh2uC+5D1D3vLZg/EALv9al48Y6haxnIcWDR0Q39T9n3RZIXjmNsXnI8wiifdR1z4nXsB59Yxvpdb9fW5DNwXbConTeWb739DoS1yJhWIw2+z2eALPUvJ5uBefdb5ypKMb77C2vffIpsaEh0Kuc/2Mil6m1eKOJQ8rfFrzZgnt6IzLWs1eAjFXbdAAIqVCL5dPStA4QgTMbTfmmU/ergg3/aAdWrXKPqzSMR9qnvQbONGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqZAUN4uQ+UXu6qqddZexXLEc5dm0iIyfjnVpTR/qaA=;
 b=A23jNhKI5N5yjjM9XYRKAGni1yeVJOuDkPwV/PV6MPZfLlpKrjfBRrtBrXE0jCY6Tvi2qQK0p+jpoA54UJoNMLoWZP5YMen5hMaTLXrwEpdtcfHalCxo34HIjPRZtzdF4DC4ulIk2OQLlvPCHp3z0Is4ECYDxPCm5fiSn0YULKckluyt7dAcdX5yDtIpgYGjNALK4OPTGR0QnCbrhBgLIiV1Nu4+j1hf0YDeqC+0k557HW+aW+G70H6QR7hdt0g3qmemo6EDYw77DHYp8fn0zQBOf4b3j0jM/Lr0qxMVJWGvzrXpEFpaIYTMCASr0JtXm84IwTUWH0JDlsTncJSwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqZAUN4uQ+UXu6qqddZexXLEc5dm0iIyfjnVpTR/qaA=;
 b=jcJDolwfCDKqK1fBjWJ6nMKucedL6E+Vs+QsWE3v8OfvsJuO+TlUhlS0s/yKORuUFniR9dBRqYsEYSdBLy6f5Jk4th+vNJ06vKL+bv0wqjA62ZrmnVb3o2tI1Au+IuSB0GtoLKcwSrSpOflUw+tVHKK00cWjXm6gSp55vL/HQl4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB5665.namprd12.prod.outlook.com (2603:10b6:303:187::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 22:43:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:43:07 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?utf-8?B?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Joy Chakraborty <joychakr@google.com>,
        Naveen Kumar <mnkumar@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Topic: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Thread-Index: AQHcP765hkb6mxiuSEGHvmS6Dp7Tg7TQXUkA
Date: Thu, 23 Oct 2025 22:43:07 +0000
Message-ID: <20251023224302.vdiryshblnkbtsfd@synopsys.com>
References: <20251017233459.2409975-1-royluo@google.com>
 <20251017233459.2409975-3-royluo@google.com>
In-Reply-To: <20251017233459.2409975-3-royluo@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB5665:EE_
x-ms-office365-filtering-correlation-id: 6794ef43-c0ba-4fc6-9930-08de1285896a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VENBbVN3TnVNYkNZOE91TWF5YkpPK285cE5XVkUvb1c0NVhzOXRNNFRQbFV6?=
 =?utf-8?B?YmNQMWd2ci8zQ3ZxNi82ZlQ1MFZnemNrZVNBVnZ3WldCaEYrdjlad29URzZY?=
 =?utf-8?B?RXFDUWRYeFhaS3k5alJGRzBIMUhpR1AvTzRYL2JVTTZCTXZXN3FMVEdBWUhr?=
 =?utf-8?B?aEUyV0tyM2w0M3ZCMEc4TkREc20xOGV0STYzd0d2dDlXYTJMZkhUR0RudlhQ?=
 =?utf-8?B?V0o4Z0YwdW83QzZCU2pSOFM0a2wyQ0NtYlkyRjZSTy9Tem8yU3lYUEhZQ2Rk?=
 =?utf-8?B?M1NTSlo5enFIbWVFNzlqOW9jc2F6QmpEUHRQckxGVmVNTFBRY1F0S0lSRmhG?=
 =?utf-8?B?clBKR0pUaGtraDVQWE8wVklnV1J6Mis2U3pnenV5OTRmQUVaQVlHd0hHYVpl?=
 =?utf-8?B?Y29BTHdudWE3Y2ZCbFZ6dGFXNStQbDgvZVozWUJPb2t2SEgvNHg0QlhYMUFh?=
 =?utf-8?B?ajdScFdxdFBBVzVwdlBraTh6UEs4WTcwZHQrQlcwM2toSG0yRFBCdXhpS201?=
 =?utf-8?B?eW9CTldnc09vWlhCRU4xT1ZpcGlIeHZFRDEySjVZQnlOZjRmODJRS2xDUmVr?=
 =?utf-8?B?SUxIbmUzdkFUbXRaa3NjWXhDZmpiT212a0F5T3F2dStlNVUxdTZXRTRUQjY3?=
 =?utf-8?B?aFFlRjlyd2xxbkJuY0h1UHZpNHJrTXdqQjhkS3gzNGg5MGRIMmljMEJ4YkZI?=
 =?utf-8?B?TW1mOVE3RmdlMEFadFZVY2hyMkNaMGwyb3pvRFIrcFVWTzJRU1ZJOXdwa3NF?=
 =?utf-8?B?VnQ4RHhPUERybUpHRTgyTWRsbmxrZjJBMTNDcEVhZlJIYXR5YUI2ZVIrSWZy?=
 =?utf-8?B?ZTVFRWlhVmpjb0dvQmR5Uk91KzI1elBJQjNzb2V5ZXVVM1JSY3NxTDY2a0Rr?=
 =?utf-8?B?SWJoaFFXTys1ZWJ0MDlORlJXMmVjcTJqVGEvRkp6UTVKbEE1cHJwbDlrNGdR?=
 =?utf-8?B?eWJNalpUUTRGTlVRNnQzaVRIYVV2RmNQQXBJR0ZuSERIcmk3QW95dENzT25S?=
 =?utf-8?B?dGxZVllWN2NmTXdLWFVia1FzM2Z0NVpUZGFKUWM3TjczNjN4YjlJWDgrS0RO?=
 =?utf-8?B?ZkE3NjUxYTJPV1pQRWEyQ29jd2NFZUlYbEVKUTQybElmMkhSdm5DSG9kSGRF?=
 =?utf-8?B?UGh1T2pwU0VTNENJaDJNenRRQ3k5M01UL0o3TytkSVBEN2g0eGRqbVdHQkpT?=
 =?utf-8?B?aDlyQUVrVkV2NmlXd2hDSmdPUkJYVGg1bW1PQVREUktEN3ozc1VZbVkwWUFv?=
 =?utf-8?B?WUYyb1hLZlkrNFF3Z2VGeWpHWmpxeWhRczlOVkFOUXRIN1ZFcWMwYWdONWtO?=
 =?utf-8?B?WXA1akVMQi9wMys3YWg3L2ZObnNoME1velhna0hNWk1KY2FpRzNYSXdEZVZB?=
 =?utf-8?B?dG5GMmNUREpEZGZSdG1kVmlkT01tR2M5WEwrZ05CUExrU25NS2lnTnRoMk5Y?=
 =?utf-8?B?S3BjVVV1dEpCN3ZvdUorM2NtY3VEUXZSbDZTb2ozUlFDQlZneVEzOGJaMzdN?=
 =?utf-8?B?Qk80RGd2L0l4UmxNU1JkQWdTbTVocDJVdXhlbHNqQUJoS1JZcjJLZCtWcC9y?=
 =?utf-8?B?MFltdTJEUytodmZYdCttUlVVVDllYWNoZ1NldXZDYWNWUldEZnhPbExEdEor?=
 =?utf-8?B?VEdsS1pvSmRpZXFtT2JpVDBCdkFpSEh5dE1ybXBBUll5YjZ0Smw0aWo2bHVX?=
 =?utf-8?B?ZFZRQ05sMDVqWnp0QmsyNUp2QURNNkVSTThYcHZsZWt6MklwcStCWjJXTkxZ?=
 =?utf-8?B?UlhraDNpQzNray9TMmNZS0NnOXhFYmFvV1Vsb2ZsTXBZR3hZOHlJNkxYSFAy?=
 =?utf-8?B?V1Q0eWpYb2hlZnVZdWpJZlNwT01YQzhOZDQ3UUd0Z3UwN3ZMMU1OTjg0Sm9P?=
 =?utf-8?B?aGNYUTA3OXBONkIvVDlzb2NtLzVvVDZxODErdUd6SGdHL0F1QUhFeXdseFNV?=
 =?utf-8?B?VlpwUzIxNW05MUw0TVJweE1iM0l3YWJiWGxyTVB1MktJNXpHaWdKSjlQLzds?=
 =?utf-8?B?SFRuaTRaUmxvMkdscU8rT0xiMVFQN1BOZzltSjJSNDg3TStZcjZJOGxId0x1?=
 =?utf-8?Q?uOt78D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MVRXQWIzWkhBZ0FPMmJUTVhIZWQ1M0JxYXJycmErNkxFNUsybVcvZmE5aUN0?=
 =?utf-8?B?MCtuN1k2NnJQSVdCcmRTc09raGk2L0hkQ3MrcTdlSHNrbzIzSUNmQ1RZNVhK?=
 =?utf-8?B?Y0NDZWowSzlPWFQ5VmNMVU91WjZ3TXlsQ1YvajlYZHY0alNNazlPMS83WEFi?=
 =?utf-8?B?dlpFeG55OG9xenBOT1VVUHEzdzZvWnhHOUNrS0NBTDJJeTJ0SGxHTDlOay9m?=
 =?utf-8?B?Yy9pMTNHdzE1WldRMml4YTNTU0RCd3Fmc1ZGWVRXYTBScDdnTGkvZzlORnJO?=
 =?utf-8?B?Y1pBOEJoT2NFa016VVVVb3FmOU5RQ2Njb1ZuNkxJUjFJWXRSYXhCa3M3a1Nn?=
 =?utf-8?B?Y1NyMmNFY2d0M013cjJiV1JhNXFUVVdXMFh4RStWTFBDV21iakx6d1ZxZGJk?=
 =?utf-8?B?ajlwVjhlNWlpU1VGREdmWUFUbVdRd29MYVRMS2M4QkYvTEdZQUlRTDNsQXVR?=
 =?utf-8?B?dFhqblFDekRIZ2VVVnFxWkN4QStmNVhvTTNpWTVlV0RQZ2p6Zm81S3IzNWIw?=
 =?utf-8?B?ZU5hb1ozUkdoVzRHN1UvQU1yWFJQUkFpN3FBa0g3R3dPRlRoMlNyZXJ6b2Zn?=
 =?utf-8?B?bTFnM0wvcVY1eVExeXBjWEhvUE8yQ0piVUg0YlFqbGlSTzh0bE1ZaHZlZ1RD?=
 =?utf-8?B?M2F0eFFrTU5BOFBNNTFNc0JJWHgvUTQvMVNrTWRKOFl1eVhSL0lsNUhUV3M5?=
 =?utf-8?B?UG9wSnc4WXZEWTg5T1V4OG5vWGQ5ZklmdEdGbjhBS1l5WTJLTnBSMmVuZGZJ?=
 =?utf-8?B?VTdZSmtWWTM1QjlzQlBIRUlvclRvUzBFNm11QWU5N2xXUWJMZFZQQWZRNmFr?=
 =?utf-8?B?QktmcDc2NFVQOUJFWC9obW5DaERyWkNIclJLcEtoNTRCNUMxbktFek1nM09I?=
 =?utf-8?B?enNmKzQ3K1c0RXBYRTMzZXZpYnZvU3ZBTzR2MFJyaDlkMm1OY0U3enVTdnpq?=
 =?utf-8?B?OXBZYVhQbnVwZkh3cm95a2RzZE9jcWlLbGVXNG5FMC9zVDRCSTVNR3FISnho?=
 =?utf-8?B?WTJOOUUveC9tQ3FvMnFYaTdNZ1lKbnZpQ3QxWHpRTnBKY1BENUtDTjlHZkwz?=
 =?utf-8?B?d1FpYnFEN2lwNlBrTTZsMlA3MlV2cWdJMDFwZnY5Uy9NMmlnYmRndEtJRS9D?=
 =?utf-8?B?SXhZNmpnMWVmU1M1YlNwZ3BNWXJLM3E4b0hKa1E2WFIxcmFCSS9IVTB3OGdV?=
 =?utf-8?B?b0l1cGFVaExRdVhtNHdDcFJ3S0JCemY4dTNRY2NPc1JJcU9MT3YvVFBCUUY3?=
 =?utf-8?B?d0NQSTZ0d1FsSXEreTlIRHB6dk5lYkcyV01CWGM1MWQwK3IyamhJcVNVNnZk?=
 =?utf-8?B?bFBxYW9xODlqRjBjN3NaYTI0TlNhVm1qTDAyVFdHVFlqN2ZaTGllRUpSUlFu?=
 =?utf-8?B?SUh6L2tub2VFQVI3SDZHbjB3SXU3ZGJFcG1EV2tweDJ5Y0hBamNVano1ZDVP?=
 =?utf-8?B?L0UyUGYxYUhLZlBMN2Y5SitsSThIYUxmalUzdG1iWS9OSlg0MWxWQVM4MHlP?=
 =?utf-8?B?ZjRhUFNOYXd4NUZoMU82TC84N0IxbUhUdW52OUZ6WGZmU255QWdXbUFYL2pF?=
 =?utf-8?B?YTZUa2tjVnhiOThXQ0FNQWR5UnVpQkkzcWJZSmp1RUtHLzd4YWZ3VEhXaVpN?=
 =?utf-8?B?UG1Obk5YVFZFRFlhOHJwVTl4OEhQVmRvTndsS1NnT0hhUkJSeGg0Nmc2OEZN?=
 =?utf-8?B?VGRjWlc4THh1SEMwWm5KdnBmZW5YNU5NYmlrc1loK0V1T2ptbjZUVWpZL21w?=
 =?utf-8?B?TE5SdExNcytwZlRxZUlVVVNTTkFsTFlPWnVGa2doVkhvRkg4Y29NR0FLZlJH?=
 =?utf-8?B?bU5KODJ0Nm5YakVGZjQ4ZHdxa3BRbTJnRndjeDVRWXFGQVo4Q3BPQmYzWkZN?=
 =?utf-8?B?MHFoQ3RkVDkwcis3dCt6M1R3WktkM3UzVTVEYjRVYzdwbnpMWG5lNE5oY1Jz?=
 =?utf-8?B?N2pPNXBtWjRQS1dMdkdyV3M1NDB2NTBJMlZ1MU5XTXFZeGRudXNLWVRaNEJ0?=
 =?utf-8?B?TWZ3WHhQRFVnOXN4dVlrNlhSb3N3UDJ4eXljaG5HWVdsd1pzUTduVU1DcjU0?=
 =?utf-8?B?ajJvSndYZzBXZEM2MElHZWdNaHc4N0ZxZndQVVBlU0xWZGtaSE1ERHF3YTFt?=
 =?utf-8?Q?IqInML2iHOK7XKZItc03PFIjG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B86228109D6644085AC6582050E34AD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s19jmi2MjsFBxZn8E/epxVMTX2tJOVXI3tdCGeV2CK7uYHTa2LLSK4SenrmPfofoG2+Afx9D2QyDNYVyjobS0v5zClVxwn9rNNl9bF8ipLkkJOGQ4IrNHzB+US8khbNgGa4rfAvgRWf6ptm5/iD+Uhh8nZQwt84OcBRFOe8fTcEeB6Ilp7dfMjSx7TVBOl4aLxRJfA3R9RZ10A7BrcKOyiyTJK7WpNmpXuLJ7ZfSl8/KPL2CKken+TBvLBlZf4CBGx+RwG58lGN2gJLBJe+JOanDqocDStkuQ1vPSjJXaAm8cUVqyNzdz1z1KO2mNsujqOXWvLt7zhn0PRBWwENAOcVhBMieUDS3i/ihBZ0WE2JlBVWrTPWkjJUKQ6B8BHqleiJEJqJlb0AAD1gClj7A2gstYa9dPE3HXWelLNrL+hGbWZf75PYoEsHmMbo4EAxJ479X0NC4PGuPV+fohnRO9zDMsLb1G3B8yaRfPeBEROMW9OyrLV4DpznfyqXUXMTg7IVDA+rVyzRms+6tGfQHotpbqWrQ9FKnspZyL3C4rUaF36WhwhMvC1yUoX1A52eF/Bw3mOsB40j3oA1Y7uFG8QoczYBOhUrpibi9XfoG1MXkDWRB3DcN99VJ2TowTeizcYyopZHjAf+d8TZ7huciqw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6794ef43-c0ba-4fc6-9930-08de1285896a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 22:43:07.8308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zfPm5etGJdyH9yWIX7CRSyoXikWv3CQwtpn8gG3bQZNu8lfwBXCcIcUwuHqMtxOTDcYj+SxPaTOA0zWJ0rXSRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5665
X-Proofpoint-ORIG-GUID: cioetK6palq4ETL_EaUj55I6ZufYYA1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDA4MiBTYWx0ZWRfX/4w8baj8WphT
 A5SP+37eOFfHra1aSBl2DKxZC8kRfpFmc4XMnqnQ+Yx+PFYBi8clfmloVCieM63QtYeIViBZXSN
 GytdIQ1nnR7K+VrBACAvIg83oGGaYHlqrQrH+BviVEWxFv1a19X4tAxxLxvb4gwHI7fssyEhkvJ
 V9auKPJ7qh+BFtmTsLmxZxP6u9a/6dv/9asyaSFUxlrnj0bLfU1e9vyYE18T/SX337wkLXxLvWq
 6sXnxGtUybKRy6narN0Ux+bINK0peSj1Jsy+qccdY4syZted0ULtasboFd+ofqNo5mdi5YjYo5D
 33oebxCJCFQkIHSGmz22FAmVtpfcLGgV05+/mHWEzhFuqE6aWLSYRGMlPuUC4XvYXn6/NhHwScb
 hoiOO6iQ2sjHl4jRbFHLuJmXp5PCLw==
X-Proofpoint-GUID: cioetK6palq4ETL_EaUj55I6ZufYYA1c
X-Authority-Analysis: v=2.4 cv=H5HWAuYi c=1 sm=1 tr=0 ts=68faaf85 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=1XWaLZrsAAAA:8 a=36muwBta7sV7wVz3mtwA:9
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2510020000 definitions=main-2510180082

T24gRnJpLCBPY3QgMTcsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IEFkZCBzdXBwb3J0IGZvciB0
aGUgRFdDMyBVU0IgY29udHJvbGxlciBmb3VuZCBvbiBHb29nbGUgVGVuc29yIEc1Lg0KPiBUaGUg
Y29udHJvbGxlciBmZWF0dXJlcyBkdWFsLXJvbGUgZnVuY3Rpb25hbGl0eSBhbmQgaGliZXJuYXRp
b24uDQo+IA0KPiBUaGUgcHJpbWFyeSBmb2N1cyBpcyBpbXBsZW1lbnRpbmcgaGliZXJuYXRpb24g
c3VwcG9ydCBpbiBob3N0IG1vZGUsDQo+IGVuYWJsaW5nIHRoZSBjb250cm9sbGVyIHRvIGVudGVy
IGEgbG93LXBvd2VyIHN0YXRlIChEMykuIFRoaXMgaXMNCj4gcGFydGljdWxhcmx5IHJlbGV2YW50
IGR1cmluZyBzeXN0ZW0gcG93ZXIgc3RhdGUgdHJhbnNpdGlvbiBhbmQNCj4gcnVudGltZSBwb3dl
ciBtYW5hZ2VtZW50IGZvciBwb3dlciBlZmZpY2llbmN5Lg0KPiBIaWdobGlnaHRzOg0KPiAtIEFs
aWduIHN1c3BlbmQgY2FsbGJhY2sgd2l0aCBkd2MzX3N1c3BlbmRfY29tbW9uKCkgZm9yIGRlY2lk
aW5nDQo+ICAgYmV0d2VlbiBhIGZ1bGwgdGVhcmRvd24gYW5kIGhpYmVybmF0aW9uIGluIGhvc3Qg
bW9kZS4NCj4gLSBJbnRlZ3JhdGlvbiB3aXRoIGBwc3dgIChwb3dlciBzd2l0Y2hhYmxlKSBhbmQg
YHRvcGAgcG93ZXIgZG9tYWlucywNCj4gICBtYW5hZ2luZyB0aGVpciBzdGF0ZXMgYW5kIGRldmlj
ZSBsaW5rcyB0byBzdXBwb3J0IGhpYmVybmF0aW9uLg0KPiAtIEEgbm90aWZpZXIgY2FsbGJhY2sg
ZHdjM19nb29nbGVfdXNiX3Bzd19wZF9ub3RpZmllcigpIGZvcg0KPiAgIGBwc3dgIHBvd2VyIGRv
bWFpbiBldmVudHMgdG8gbWFuYWdlIGNvbnRyb2xsZXIgc3RhdGUNCj4gICB0cmFuc2l0aW9ucyB0
by9mcm9tIEQzLg0KPiAtIENvb3JkaW5hdGlvbiBvZiB0aGUgYG5vbl9zdGlja3lgIHJlc2V0IGR1
cmluZyBwb3dlciBzdGF0ZQ0KPiAgIHRyYW5zaXRpb25zLCBhc3NlcnRpbmcgaXQgb24gRDMgZW50
cnkgYW5kIGRlYXNzZXJ0aW5nIG9uIEQwIGVudHJ5DQo+ICAgaW4gaGliZXJuYXRpb24gc2NlbmFy
aW8uDQo+IC0gSGFuZGxpbmcgb2YgaGlnaC1zcGVlZCBhbmQgc3VwZXItc3BlZWQgUE1FIGludGVy
cnVwdHMNCj4gICB0aGF0IGFyZSBnZW5lcmF0ZWQgYnkgcmVtb3RlIHdha2V1cCBkdXJpbmcgaGli
ZXJuYXRpb24uDQo+IA0KPiBDby1kZXZlbG9wZWQtYnk6IEpveSBDaGFrcmFib3J0eSA8am95Y2hh
a3JAZ29vZ2xlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSm95IENoYWtyYWJvcnR5IDxqb3ljaGFr
ckBnb29nbGUuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IE5hdmVlbiBLdW1hciA8bW5rdW1hckBn
b29nbGUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOYXZlZW4gS3VtYXIgPG1ua3VtYXJAZ29vZ2xl
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUm95IEx1byA8cm95bHVvQGdvb2dsZS5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvZHdjMy9LY29uZmlnICAgICAgIHwgIDEwICsNCj4gIGRyaXZlcnMv
dXNiL2R3YzMvTWFrZWZpbGUgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMt
Z29vZ2xlLmMgfCA2MDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAzIGZp
bGVzIGNoYW5nZWQsIDYxOSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy91c2IvZHdjMy9kd2MzLWdvb2dsZS5jDQo+IA0KDQpTb3JyeSwgSSd2ZSBiZWVuIHRpZWQg
dXAgd2l0aCBzb21lIGludGVybmFsIHByb2plY3RzIGFuZCBoYXZlbid0DQpyZXZpZXdlZCB0aGlz
IGluIGRldGFpbCB5ZXQuIEkgdGhpbmsgdGhpcyBjaGFuZ2UgZGVzZXJ2ZSBtb3JlIHRpbWUgYW5k
DQphdHRlbnRpb24sIGFuZCB0aHVzIHRoZSBkZWxheS4NCg0KT25lIG9mIHRoZSB0aGluZ3MgdGhh
dCBzdG9vZCBvdXQgaXMgdGhhdCB5b3UncmUgYXNzdW1pbmcgdGhlIGhvc3QNCnN1c3BlbmQgaXMg
YWx3YXlzIGhpYmVybmF0aW9uLiBXaGlsZSBpdCdzIHRydWUgdGhhdCB4aGNpIHN1c3BlbmQgd291
bGQNCmdvIHRocm91Z2ggdGhlIHhoY2kgaGliZXJuYXRpb24gZmxvdywgaG93ZXZlciwgdGhhdCBu
ZWVkcyB0byBjb21tdW5pY2F0ZQ0KdG8gdGhlIGdsdWUgZHJpdmVyIGhlcmUuIEZvciBleGFtcGxl
LCBpZiB0aGUgeGhjaSBkcml2ZXIgaXMgbm90IGJvdW5kLA0KYW5kIHRoZSBkZXZpY2UgZ29lcyBp
bnRvIHN1c3BlbmQsIHdlIG1heSBnbyB0aHJvdWdoIHRoaXMgaGliZXJuYXRpb24NCmZsb3cgd2hl
biB3ZSBzaG91bGQgbm90LiBCdXQgbWF5YmUgdGhhdCdzIGFscmVhZHkgaGFuZGxlPyBJIG5lZWQg
dG8NCmNoZWNrLg0KDQpJbiBhbnkgY2FzZSwgdGhlcmUgYXJlIG11bHRpcGxlIHBsYXllcnMgKHho
Y2ksIHhoY2ktcGxhdCwgZHdjMywgZ2x1ZSkNCmhlcmUsIGFuZCBJIG5lZWQgbW9yZSB0aW1lIHRv
IHJldmlldy4gQXBwb2xvZ2llcyBpZiB0aGlzIHdpbGwgdGFrZQ0KbG9uZ2VyIHRoYW4gdXN1YWwu
DQoNClRoYW5rcywNClRoaW5o
