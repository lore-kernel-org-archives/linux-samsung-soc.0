Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758E1E2834;
	Sat,  5 Sep 2026 00:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788567365; cv=fail; b=d31LDrCxUhXsFyatA25W18CIkof3DWNfEEIPXOovJzmoJeKELa1c8ISn6cL7DYnwzQS8m81xAHX/330o1klmXaXQQ/TqE5Ufc0Pu5vfJ5BWO7DYjL6dJKfPTLl76uBu4TBzDtgLj/77Z/frMpTi58iNCzpmUVdL+NRK8XJT5c1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788567365; c=relaxed/simple;
	bh=PxL5AMrov6StKgbnj0UCBUKPKAwjPlp+QwkG/ohaTLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fSGgDSk88DGILPX1/znhJDN3SHUI9mUjXBXzv+X30W4TU7uJnUtkQ8g7Y34VyxJp/ha6BIFxq9JwqFuCwfYn4oMUR9sJywPY57PVOgyHJQOEvVC2MzHV+/LabeIx4n4FFNXwC6MBsU5LekuJQPUst1FMejPdsf156lRxlenSC7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HPrxjf5c; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LYmJVv4e; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nbY6ZpQh reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HPrxjf5c";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LYmJVv4e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nbY6ZpQh"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KcuaY1143350;
	Fri, 4 Sep 2026 17:15:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=PxL5AMrov6StKgbnj0UCBUKPKAwjPlp+QwkG/ohaTLQ=; b=
	HPrxjf5cnR2daQgM67MoUzUY5MK/k+Es6MNS6StgRNlv3otfLpXv8lLz6NiJCL4a
	I81NfwPxFhJVxsZX08+KxjoGU1oj64c7L7zuY4wxzbIwDKI+UKKi/ZvR+C+8mdTr
	c+1kmAWow2/riFpYXTbFTxAryPXMOQT+QnokzE79zVn1hFiHjkIIt4cRww1NqN9T
	Bfc0oFvBLxblpm2RRlJM6MtamgmO2Cq6yU3DOVFoElUkO7ZUsXAPukAP2We1y5Jm
	BoMyrLgbcsRofiiq0eq3J78FPnp4RqaLPztKuzgx/AnlFr4Hy4OkNQwgd0L8fkUU
	6MVLLS/42lgsXSnUpIyneQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gfrm1b15f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 17:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1788567349; bh=PxL5AMrov6StKgbnj0UCBUKPKAwjPlp+QwkG/ohaTLQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=LYmJVv4eWCDUasbszCYXeZrx7APIBE7lf3RJgc8E0HRBJhoSWD+IXcGeRbBcCdny/
	 7bpTrnir410A4vZqGM+t6WR9Nm1XiQvx61uLeR0LpUXHPB2I0Y24vxPVPug3j3zC+D
	 Y+G1n3QBBcB9bdW+u6AccStEXU9SendX9ECy0WrMl6tJEsyfOZDWR4TWkSHhvRy5Gf
	 YGNZHn5Wod/97g+MmVVglRZDKcVINrRvT5+FbQXYPUCFEzWz1/m2G2mHALk1JJdbtR
	 083eBuN5F6NTgx6FywTIXYCgGxVY/se2jIWWD7Om81BP9mdMen6aEHVyMtYGVcZNII
	 2hseuiJvLBJbA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1419C4014A;
	Sat,  5 Sep 2026 00:15:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C5771A033D;
	Sat,  5 Sep 2026 00:15:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nbY6ZpQh;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00300.outbound.protection.outlook.com [40.93.1.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A0CD14048F;
	Sat,  5 Sep 2026 00:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aT/oZGrDx8IKmmNVV4Ev0KhMAA01QYg565DFlW1Sv5rJibOBm6JfBDFKmkentGqi3XJK/j7gUCiWyDpuMExOvQnmO+Btj1CYWjB+pGW0bS9gvDz3IHRalSjCrRr38qa+vW/5/UCYYvqfjHCwMmDfcMel1MI0lW7sw8PoDbM7tHOQP3P6x+4LcYQbHpbpqg6OMt9qWI1kT1i25qVnnnb/yICB50AE07/T329bwkGqpdmbDmQn1p0XJrkX68RVLoYWKof+Mvej7+su6bTDhkvwwMnl/0HDQH87m3MdgrB5OyYppnu5wH/Lfvqhkf+VnF4YdMV2AoTr4yloKUpExXJ3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxL5AMrov6StKgbnj0UCBUKPKAwjPlp+QwkG/ohaTLQ=;
 b=DZ/+mO5rHWAcooSCPgPSXKH0nxy6pbCMSYdE9G1XffkHoc6APEX+ZJa6Dva6Q4+CDlHMBra5p9TYcjsuRWi+fTtyjNJ1IcQlhOQFWvw3+lzX048rsigxkwZhO654jL8nRmiV7y4oKuSoFuiZrVgkhf6QQC8fKiSzJsmpQ7uk7peiUmHnz7KdQiYrJ9x60H6aRagBaf9eSA7l3e0tjvnDK2iw5E2uZ0a85hBhpWqSDxM7CO/tTwVmYm0AgrecMizf/J4ReMXK+Sp4W2bYCGsQn1Tf/+UJqi0IS7HN7tsEJyBZnIGJ+MMF1UvSNGSjyV0le5AMDe/WTgQca7yxnV7zwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxL5AMrov6StKgbnj0UCBUKPKAwjPlp+QwkG/ohaTLQ=;
 b=nbY6ZpQhXo0/Fm2nVaAIrCSEZD+bm3sx862uat1q8I+HVV7+ybGcDQHF+Y9pL88eOv0YTZ2Yg1+l9R3SIZ6aOHZ8D1imwyZ2Mw763+iGIlurFCad7K+ayGUKnoar/6PAmyma5VPcGVy6wPSDXFu++C4sbIY/2oayEtCuUgIE4BU=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS0PR12MB7632.namprd12.prod.outlook.com (2603:10b6:8:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 00:15:43 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 00:15:43 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
CC: "krzk@kernel.org" <krzk@kernel.org>,
        "peter.griffin@linaro.org" <peter.griffin@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jh0801.jung@samsung.com" <jh0801.jung@samsung.com>,
        "dh10.jung@samsung.com" <dh10.jung@samsung.com>,
        "akash.m5@samsung.com" <akash.m5@samsung.com>,
        "hongpooh.kim@samsung.com" <hongpooh.kim@samsung.com>,
        "eomji.oh@samsung.com" <eomji.oh@samsung.com>,
        "shijie.cai@samsung.com" <shijie.cai@samsung.com>,
        "muhammed.ali@samsung.com" <muhammed.ali@samsung.com>,
        "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject: Re: [PATCH 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Thread-Topic: [PATCH 3/3] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Thread-Index: AQHdO3O/WmNIU1Ki0kiJex8cHd72zba/IHgA
Date: Sat, 5 Sep 2026 00:15:42 +0000
Message-ID: <aptfI4WN3PTPk_IO@vbox>
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
 <CGME20260903071322epcas5p2a40e3299b0954dd880c9b3651555760c@epcas5p2.samsung.com>
 <20260903071250.3421499-4-selvarasu.g@samsung.com>
In-Reply-To: <20260903071250.3421499-4-selvarasu.g@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS0PR12MB7632:EE_
x-ms-office365-filtering-correlation-id: 2a184e6d-99c6-4d58-ba0c-08df0ae2d317
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|4143699003|11063799006|10067099003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 gbMz8XEQsMp1JB/ctkpbyWbSF0eH3Vse0odJK2t7tjfrL229wz9P+X3XQOYlq8OIohViq3e54fkX1O+u0xqTaC2DIOkWOnzzjA/HQtDBbGhJvj7HMPnWhOB9uJxMQQNFq6wslo5ijhNW9t6tPnul0+WJl3amNgEodtNEPX/A4PgE6Dn19KZ6OYnBC9tByPi8XifnLvifdePMHqMK1Mbj6pF1sYy91PNRQfpuxza1ao8js+ZXIOknV05VEWZXCPtzOLlbNaZL2gLm+b6WQ6ORzrTo/wCQifVoNqo7gwDk8C/XlQLKHNWflz9UenLYwZX0m4qByFl+cWyuHfz+ApZMymYEZKW4nRLgX/4x0C555s9E6sUazNOyDmcjIf0PsAd8dEErwZpGNbuLG/TC2VQZ4t2M1/tyiT8vyMLjQcYl5iZ3gjxX8pKeUDd4ZIK2KiBEEqh+qXCQvqlSfsXMmRZIqiBn38LBtrDTWNytFrui220RB6g0bgQlJYePeoCN+RyLYP5y30fra6PSmvVF51nBEc6nbt0pF5KldMfLh82f1Aws1mABDHEXeouhJ75XaTHH/38kmJQthxfMsQ6qi4+j6uBHQ5MsKkzSVbFeV/Re7La3uryOVY8iMziiOZowPxCHbWlpxhaznL6rrvd2LLiIdntKz6wLO8Xh/esTm8c3FYJfpI4iF2Ogoyk6M/RXYARTCx3dYio8TdzPVV7QFhGmYkv+nbr9yRjD/xudJIKCrkY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkpteWZZbG54Y0c3T3Q0MkdaalpsZkVoOHZneWQxNkRXeHhvTi9lMHMrYlBm?=
 =?utf-8?B?aUFpYTAyb0JEZW1iSW9hV3VuWkNmUmFYeklFWi9LNVlIQ2wvNWVicGlyT1pN?=
 =?utf-8?B?ZTFReDNTNlNqWjhEVGRMdWhZcEhmeE5nNGhmcitna0FXb1R4N0NkUmpZTnli?=
 =?utf-8?B?Wi92QWM2Y2hJTXMrNGZHaUtWYmRKQXZtaGloVjRsUFhDRzZpajdiV0VXK21x?=
 =?utf-8?B?V1ZWMjdiRUhxTGNVeUwvTm1SQjVCaUJON1hWV09qMEpGeFJQVGlmcDQ0ZlpS?=
 =?utf-8?B?aTNkNXpTK0RneXVLbmtNUUlvYVBPcjBwWXlqY2svVm9lTmRnb0dic0tkcHUv?=
 =?utf-8?B?SjU0UFVQUUVwMWxNWWloeUwxNGJQejdSNzRaUUJLMTZ3K2d2UUkvYnA0T1dj?=
 =?utf-8?B?MW1US25lL0dZRFpvaVNKMEs0UUFqSUxFcGwzbVY0QWxwU0xzVElXcFRLcE1U?=
 =?utf-8?B?NGgwSkhNYmdKdVR2VkZ6QU9nYnFlL2lUc3J1Q3ZneDV4UXY0TVBVdGMxdits?=
 =?utf-8?B?ZmgzSDRsRnFoUHNTcGlUWHlhZ3J5NnpkYjBNODV1OUxQeHJzbXdhTGNkR09L?=
 =?utf-8?B?NTRxTzdsT3pDNDd1QlgrYUlGY0pKY1FJbFZXM3pYSmFOekNmNXNsUk9HODhJ?=
 =?utf-8?B?eDI4eTkvN3AxZnZaWDBORjJwS0t2Tkc5Q2RqQld5VEJmanRiNVVKRTNiWlFE?=
 =?utf-8?B?STgyejg4SUZ2bE5yYWpoSGt2dGFrVU1aSys3NythbFpMVmM4YlpKeUFOUG9R?=
 =?utf-8?B?MTdyZDFrUGx6ZE42WnAyOTZ6N0RBZktjT1poNTZhWnpzVERnUHZibWtOZi8z?=
 =?utf-8?B?bldmdkNkQjZXalNYRWRrcGdvTDYrT3JnRXYwYi9tcmdiSmVJT25HMUtVZk43?=
 =?utf-8?B?UUw0UU5TNVdkc3N6empQVDVWUVRmNlVuWmFBUHZXK3pZS3NtNS85OHhKSEJP?=
 =?utf-8?B?MFYvZHYraHJYSzVtUW9xRzQwYit0YWJ0eUNaNS84SFZ4WnRRL1pFdnVzVFZP?=
 =?utf-8?B?emFyRDZBUFZURndRVklXS3JMb1BCZ0JnbGpNZ1NQQUNuRzE5MzgvOTArNWZB?=
 =?utf-8?B?S09hengyOUJJb1B6RkNiTGxqWnJLYlpzcmNIdXBTbjNUWEZXUFgxYjNBNU9H?=
 =?utf-8?B?WmY1b3BJSFR2bm92Sk53ZzJSVmZxOXdoNVJRYzYwcEFNZzlrcjVGRUx5cWw4?=
 =?utf-8?B?OStLVG9wQlJqN01xQUloNTZURVhVMnYvbkRKMHcvYS9nOVQ0OHdxaktjQ0U5?=
 =?utf-8?B?RW5SckNZK3QzZ3ZwdVJKSGZ3SVh3MFR4dWZFVElWc1dSdkxGRDY4RlFjTmQx?=
 =?utf-8?B?OEc3NGRqZkZJZDhJdS9jWUNiLzJnNFdjdXJIYWsxRDVTditnRVdNSGhhclhi?=
 =?utf-8?B?QkhNQ0dLa3NCTExqOEg4L2huS3VpSUFsWWZuV3hvRFpPY2tRQUZCbVRxMERr?=
 =?utf-8?B?bWdpVDVRMU14TmN2QWxiN1d1QTNpaFVrbVFpN0dOQk5vZGVIUkM2d3hGZE9j?=
 =?utf-8?B?dkNRc2JOMVRjTEdVWlN5YzNDOHo1NkFCNU0zTUgrcGJoV0VlWUNTb2R5Vmov?=
 =?utf-8?B?WUFYcUUwN3M4UGlSdEdSVUNvUklyNnRDQ09CdElUWFl3bGtsWlBhN1R0U1lG?=
 =?utf-8?B?bGc2VE5GZ0VCazBvSGhuL0dHbFFUUVgzTWNObnEzVjVRNk15c0ZuN0dTTDQx?=
 =?utf-8?B?ZGZXb3ZYUEdUTE9MbHNqTGthWnRVRFZXRjVkeHFJRFVKTmZxUXFVSmVtNFI3?=
 =?utf-8?B?OHZpRlhBdUh3NTFIVWFrYWZJdFNMZ1N4S0lpYkFCMmlBVTVBWENkMDA0YVdz?=
 =?utf-8?B?SmUyQ1loRmRGejU1KytrWW5ISmp0cFBsY3ExdVljRU5NREh5ZEVqVFFiQ20x?=
 =?utf-8?B?RUdXRmQ4ZThXUEM0aUVYc3ZTQWpHVjdUVnJhU0Z2M3c2MVc0T0FLWGZSNFRS?=
 =?utf-8?B?U2tiamN3NVRaOXVPeDlRcWx4cUlWMGVSdFFvT0tYVS9DNFpYR0lMa0d0N2dY?=
 =?utf-8?B?dEx5Wk54RlUrL1V2U1NsQVpHd3JBbjV6SlQ5UnVyWVlwV0lXaFNPLzVvQ2NF?=
 =?utf-8?B?RW5icEhmWUIyZmhhMDU5Q0NmN0NER1hZM3VPVDNDcHh2MEVHVXgyVFpaamNG?=
 =?utf-8?B?NDlCQUVIZUQrT1pQRWI3MnJ0UDIvWUo1d3FLdG5lVGQxSTRtU0g2UFNoQjc0?=
 =?utf-8?B?eUF1dXd0SVhROXlUU1NqSHROUW5qb2RHVkxGMlhZSXFGa0lLT29qQ0I2ejNm?=
 =?utf-8?B?QS9RWVhZQnl6YytkRWlLRHhTM1Q1WDdzdTBYS1lzbTc0dmM1NWFBYzk0Q3JC?=
 =?utf-8?B?RjhhU2RLVzh4eU1WK2QrTlh4QlVFQlcySXJoM3hXNmJQZUh2YzlyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D780D0310A23FE41B436549CEC68A89B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	LKgs0fwkvduUCqV0q3wRhFiBtyBeQb47D77vnC12rwiNda3iM+24qi58oWSSrVVQJOdzGFsEgHiaBm9bTnLSj1QdbcBMgq1z9QBLJULoeBTOvevnXOdGl29Noh1l97nr/ud7RgkeiY1j/LtnQgFEdfy7ivhZUY5VPQ5WqbyeeWqBvE26F39pLBxHHJdzR5x56dI2ASef+xaOHeNAnlOB9EWq+HaCrAA7mj9L2xyVQL06jDD1p/9xz4Ya026QrVYqjD+AaxY/dn5VzfONvyL+h3oUPhEFIs7sQxEnlp6v6hLpzF2aY+1c4VSx5VKl8ABjf0eAkQeRBjTnsvi9mWUahg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xZlbmen5Vk4UHwyWEYS1Sru8fcnteEKuteyL+McehqN81rPIzoJYKNPUNoqtHJbxaRmsCyt0gvL320+Q+iiEJn9FW+a9k7xPOOijTZ+XlwozMe7fRPDn7AvOHTiLToEIW8EyfObvbaSk4EP903VUKHF1d0i0NVA3E+f2owr0LEWhO9+TMdR7Szzs7DIrwescUecuiuYOOcoc4bpHA3TfkKtWKmBxjtEmpHkrYHaCYUlJfdXV22I/+rIorXRkT1jSRr9LX7yQjs+boOHLpJpjcRZ3IsAXQek/lkAGpGKCNHY9EKF7Yo/qnxud7CYXFJ3zsVOl6vGCY1ZIb3wMOBQW7MKMlSNDASKBWXc3PVy1dvtcnXjJuwUcsAnX++up2/UV+WO+Ip82u7ytmtfJKdXe2DYQ2rWx79fNEvJ+QWQ54o7TN1uHITGECBQfNYVTkiFNUskrZCwZhqIYG/LTew9nt+wdxU7VD/cevZbYONVWPOOZiP+cUY2xcplCufdvL+9DZ5O7zvd/QD6W+k3s5Nm8O7Y+cwLdGYtF+fhq8ZRWXB2JZu9XAHObEZJFd8dT+dOIL87pIvaV+m8r1c/UVcor+Zi9MgegMq9YTQh0wE2gJ945sdevzUWXIh17xksMeClPjrEhutKUnShxYeT2zRraTQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a184e6d-99c6-4d58-ba0c-08df0ae2d317
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2026 00:15:42.9654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wkKotaza60SyXMYf07R4m9PZ3YKJ11EP8RaKVXI62oO2/gl03P8eE8ehYzzzrYm3TzY9qvgNsg1YcLR+zCXkBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7632
X-Proofpoint-ORIG-GUID: jIEf1K9ddAqXQ0ePLJXBDJ-ir3xpcgWr
X-Authority-Analysis: v=2.4 cv=L88theT8 c=1 sm=1 tr=0 ts=6a9b5f36 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=hD80L64hAAAA:8 a=jIQo8A4GAAAA:8 a=IzsotTFDeBTq9V9Kb6kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: jIEf1K9ddAqXQ0ePLJXBDJ-ir3xpcgWr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwMCBTYWx0ZWRfX38hDlm4DMdHp
 8cQLBMNEuLO5J7g78Zt00bpohFwB+F4pabLB7zK7xpG21y4r1E1Tk6P1imYKMeEkBcPXKseISQt
 cVGUrmj9QM15zL3kt20DeFIzhVoZOF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwMCBTYWx0ZWRfXwQ+tu+RbPE4k
 OMJS9w2ONgOkXb3ka9nPIjdrpXjPRVnRuyyym2zm2z2+2ZBVzrN7pItxDWaPW190rNB2fZ7DZAV
 RUwqv4YaluBcD5vWOWDKb5jHWH7YYX8ctS5FfLhJsln/OMnncBD7m11j/5FicxhuNWroeBmRf0o
 qhayE7upA9UpxxfZTRt56PG6hR9gJIGg9Ny0kK0kyt8FSUCxO128oqCxIMRnJRaimoaVXItaYkU
 bP9DKrCmz2B0Lq6kffBI+zzE8JKj8WMZukLy8k3qB4tpR/rktWjKhMW7nCxGRPVcd3NfvGA6y7G
 DfUPS5ic93QbNukAw9gng4f3ZxwaBUysQnn4DbVhqjAm3+oOgiDDpP3cFZc4zQzTP1uLx0JCWh3
 GhnV+Cg/E06pOhRT+OR3kCCjrWzY4nlVTmI/ynaKMoiEufkWpIR0Nu0U3v5+dHJLycZUG+nOOun
 Z0nw9Lhfe0ADeCs8E8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609050000

T24gVGh1LCBTZXAgMDMsIDIwMjYsIFNlbHZhcmFzdSBHYW5lc2FuIHdyb3RlOg0KPiBBZGQgdGhl
ICJzYW1zdW5nLHNucHMtZHdjMyIgY29tcGF0aWJsZSBzdHJpbmcgdG8gZHdjMy1nZW5lcmljLXBs
YXQgc28NCj4gdGhlIEV4eW5vczg4NTUgVVNCMyBEV0MzIGNvbnRyb2xsZXIgY2FuIHByb2JlIHRo
cm91Z2ggdGhlIGdlbmVyaWMgRFdDMw0KPiBwbGF0Zm9ybSBnbHVlLg0KPiANCj4gVGhlICJzYW1z
dW5nLHNucHMtZHdjMyIgc3RyaW5nIGlzIHVzZWQgYXMgYSBnZW5lcmljIGZhbGxiYWNrIHRvIHN1
cHBvcnQNCj4gYW55IEV4eW5vcyBTb0MgdGhhdCB1dGlsaXplcyBhIGZsYXR0ZW5lZCBtb2RlbCBp
bnN0YW50aWF0aW9uLiBUaGlzDQo+IGZhbGxiYWNrIGFsbG93cyBtdWx0aXBsZSBFeHlub3MgU29D
cyB0byBiZSBzdXBwb3J0ZWQgYnkgdGhlIGdlbmVyaWMNCj4gcGxhdGZvcm0gZHJpdmVyIHNpbXBs
eSBieSBhZGRpbmcgdGhlIGZhbGxiYWNrIGNvbXBhdGlibGUgdG8gdGhlaXINCj4gcmVzcGVjdGl2
ZSBkZXZpY2UgdHJlZSBub2Rlcy4NCj4gDQo+IENvLWRldmVsb3BlZC1ieTogTXVoYW1tZWQgQWxp
IDxtdWhhbW1lZC5hbGlAc2Ftc3VuZy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE11aGFtbWVkIEFs
aSA8bXVoYW1tZWQuYWxpQHNhbXN1bmcuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTZWx2YXJhc3Ug
R2FuZXNhbiA8c2VsdmFyYXN1LmdAc2Ftc3VuZy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJp
Yy1wbGF0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gaW5kZXgg
Y2E2OWFjMGViMDdjLi4zM2E3NmMzN2QxNWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3
YzMvZHdjMy1nZW5lcmljLXBsYXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2Vu
ZXJpYy1wbGF0LmMNCj4gQEAgLTIzNyw2ICsyMzcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBkd2MzX2dlbmVyaWNfb2ZfbWF0Y2hbXSA9IHsNCj4gIAl7IC5jb21wYXRpYmxl
ID0gImZzbCxsczEwMjhhLWR3YzMiLCAmZnNsX2xzMTAyOF9kd2MzfSwNCj4gIAl7IC5jb21wYXRp
YmxlID0gImVzd2luLGVpYzc3MDAtZHdjMyIsICZlaWM3NzAwX2R3YzN9LA0KPiAgCXsgLmNvbXBh
dGlibGUgPSAic3RhcmZpdmUsamhiMTAwLWR3YzMiLCB9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAi
c2Ftc3VuZyxzbnBzLWR3YzMiLCB9LA0KPiAgCXsgLyogc2VudGluZWwgKi8gfQ0KPiAgfTsNCj4g
IE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGR3YzNfZ2VuZXJpY19vZl9tYXRjaCk7DQo+IC0tIA0K
PiAyLjE3LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5v
cHN5cy5jb20+DQoNClRoaW5o
