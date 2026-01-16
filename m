Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52B933F8B7;
	Fri, 16 Jan 2026 17:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584785; cv=fail; b=d/1zVnK0eyb2lyUekdXMBMDysQ8N0VvGlISmwmbRIsnYvsI5u7QmSp0GgsvWIBo/7NiI4losXAQVxlnoR9T0yA+nB8oQnoU8S0tNobgKbd2/cZddOXdXbMiFCCenj8WGa+GW1OANek8G/hMhDDkqJOj3Nqfikji1+61V3xos/jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584785; c=relaxed/simple;
	bh=shVSKcZ0TmK+7U/tQbucJ4vvUfCotLItHVG4Sf1Cg8w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EoY4cskVSs3agX/1/7om2BSTraZvwOEv/zawyUE5BJT5/v+08GZPArtm3cvq27E9KoGZfVkHR8VVAGhb7AcaKhIZGUlmS3SkjmH9wyIeDUHW39kkCnOQ/t8DSxBpjr1RTbS1PHVEp/YNzXx/AQeHgK5Co7FhTEaKe/3WOuxdy0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Dd+MZaHH; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XcY8ojwr; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UZ6z/WFX reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Dd+MZaHH";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XcY8ojwr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UZ6z/WFX"
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GFLwLW2985147;
	Fri, 16 Jan 2026 09:32:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=shVSKcZ0TmK+7U/tQbucJ4vvUfCotLItHVG4Sf1Cg8w=; b=
	Dd+MZaHHLmFQEI+vEmbsevFFd/fQfecFF6O25YGKdgyuEL12zgTXBAR18mMOFy9Q
	/eL6scxC18QhKdlueWXpEWJfO3ljrtrjKpFT7IurTgQgk2MEpAz/KCOQLcjwSWl/
	bD6WJ8s9D4eKaCL7sKgSVovB68GsprXxUaVpmde37xBh90Sf6vM1v5DUwbI0t4Mo
	fmI9Vpes7eEOpkyScYuh+m/VZ7jI8Fbl80Ah/Y3aWez0I7mnEjjtAU+2t1VOdmdu
	2rQI7b9DEDrlkpvc0NbMjn1q1WHLIPUVObnYoX+Fzd6QvOLo2bo1Q1rvWg7tzbme
	R88AkBghmKIjnEIVlVJwHg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bpxk5prsb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 09:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768584756; bh=shVSKcZ0TmK+7U/tQbucJ4vvUfCotLItHVG4Sf1Cg8w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XcY8ojwr+odabEX4x8KOpe6O2zCaxh5CHH5m1IbvhU12l6egRGitBX2AZC0xWjAz3
	 XsWTxWHcYeCtCezrH1k9G/AdwAxszR3VYRX0rqKAg21Es83+DHvYsAk54NMlLHO9iw
	 pObTYDhtzf2qWuoqObLGYMrHSxFEV1fp5ziZ6YBJojwt307lZhTChiB2KD7PM9eG5Y
	 F63MV1k9s3Kjw9L2iD4gTTry42Fi8JDyMBYjEFq04QU37IpqpC7Aa5vWJzg68rSTRx
	 jRRHWTUz/J8q5F2CrvRUyZ3oDbZqhMnyV1ZJq4CVB+x2s1mdDk93VgzBvtyosTYgIT
	 vU0MbM/bXX6KA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 48339401EE;
	Fri, 16 Jan 2026 17:32:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 89877A00C5;
	Fri, 16 Jan 2026 17:32:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UZ6z/WFX;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2B41840356;
	Fri, 16 Jan 2026 17:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxNskHsSnamJL6nDcnSSFDVYqyARk1rfMfPnu7xcrD/nfx478aJR2UmFEpc8QRQjNQVwywHX4s/ISfDnLn90oH/ufNfAc+RfKUbmfVvetvJlFD6wL0+4t9m+HS3VfqDG5Bi/eP2X5rLEZnCvDFB2ZqxZyGibrnRLkl1J8Myu/6ECZKRqyOlqDk/GgY61HDsTe5nFROSJIgHdmfyBDhepGcbzFeQUEc0JytE+9gYeIhKjrpG36bKAvm85RHaK8sC20mef/hCFphue+Pw47k3qi0rkAKPvaWgzxACo9SY25UPZpOjcc4KYr0wB4lwMh92xiuSYevkD3Q5DQCXKxQhr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shVSKcZ0TmK+7U/tQbucJ4vvUfCotLItHVG4Sf1Cg8w=;
 b=WBNg442TNsFkpOxHrii+iYlBPmUOEGC0zEJ371Q6kLlcnbWCwG1Adt05vylJzDvA4M1gCKb35uYQXGzNfuI6gsZhz4VRfw/zr1ZtzH7ym+gEES0+i20pv804e9R9uXT9CLuDAN+/MSddKne2daxo2aONhf0cHmOxyseQnWxZ7a0YkaLxWTuKGQjqP9DMiBDJWin2Y1yV8dqDX3JpJqmrje+YQ3xDaSfibEzAMLAF3uvC2fCrwBUEn+kAZbsxVHRQ3Jd1Omp49tUonQ7E9HGrdV6YzRJXDy0rXLA8n9qpxKhUGt5RVQ/kPO77eCPXHRKBkPmGb9cEXBEex0ui/1ax3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shVSKcZ0TmK+7U/tQbucJ4vvUfCotLItHVG4Sf1Cg8w=;
 b=UZ6z/WFXDkKLLUSQLTNkR/da+MQZr2/WGNSBhOnVHVb2a/isIfG/ZlSLE2NqaboXn6U2/ieeJ8Rvf1ue9DJdKvhdl58LHYIKJX1VND+qTZwXIQzwi+S/Z/BspZO5mgNdv6ImAdGFClg+IB2WwhUy3d2Xdzv/SM41gHyPj4zVuiI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN6PR12MB8592.namprd12.prod.outlook.com (2603:10b6:208:478::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 17:32:18 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 17:32:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chen Ni <nichen@iscas.ac.cn>
CC: "peter.griffin@linaro.org" <peter.griffin@linaro.org>,
        "andre.draszik@linaro.org" <andre.draszik@linaro.org>,
        "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: google: Remove redundant dev_err()
Thread-Topic: [PATCH] usb: dwc3: google: Remove redundant dev_err()
Thread-Index: AQHchcgWFP3R/gzty0GgpVaZ77nhPLVVEIYA
Date: Fri, 16 Jan 2026 17:32:17 +0000
Message-ID: <20260116173210.5iugbcn3qcjenosx@synopsys.com>
References: <20260115023800.4142416-1-nichen@iscas.ac.cn>
In-Reply-To: <20260115023800.4142416-1-nichen@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN6PR12MB8592:EE_
x-ms-office365-filtering-correlation-id: edb82247-42b1-444f-eca4-08de55253249
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tm5ncmRnWTZXM2FlYzM3RUppTWJjbzRRMU9MUEZoTE9xK1FwMlNiZFJQMEtJ?=
 =?utf-8?B?SUdQVGZoMFdDeThlcnRodE5mSlNSN0hQYVM2ejgrSWtBREg5YUk3cDNNSHNs?=
 =?utf-8?B?QTg2ZEhqdUphcHBaazlQWUhQN2RibGxLT1AzalcyMXEwOXd6WkdkcEF2aU5x?=
 =?utf-8?B?NTY4ZHYrY2VOUWJaRFNxNE9uUXFHSFhzQ3dWK0x1a3VZUmlwSFBndlB2MCtO?=
 =?utf-8?B?Mng5aW5qQ2VCejFtZUJYdk53S0JqWVUxbzg1ZVdKQ3JOK2xaMXBid1pZbWdn?=
 =?utf-8?B?SVVGRTR5U1ZKNi91N3B2NXZSSUlWb2tkd3Zmcnl1T1RvemQvR3M2RWRqRmY3?=
 =?utf-8?B?V2UxM2l6ajRCUU5admlTKzFLRnpKWFkvZzNzaVNOcDV2QUhMdUVsTWdXRHI2?=
 =?utf-8?B?TFJmVjQrUTRweUxxR0pzWnlDYzdxNk80T1hoOHJkWllYTWdXdUFWWFNGY0I5?=
 =?utf-8?B?Z0NDQU5OaDNOTTZlUDN1SjNxWEtHeDZCd3YxQm1LN09SeHpKeW9vdVNXZFVz?=
 =?utf-8?B?VHRuNnp4cmJqOVVEbld2M1JYQjZhRHRReW9XYjJJUmk3UCtVeHBZRlZOaXY1?=
 =?utf-8?B?UkhaZHYyRzRDalQxd2FRdEpXV3p5ekg3Z2tESkpKYlhsT0YwR09VQW9PWnlJ?=
 =?utf-8?B?WkQxMVhUV0pHbWtjVUlhb3FmZXA4VFhFSDlOQ1RqZHJFVVhTYVMrWlViR3NY?=
 =?utf-8?B?bUZhYmxCNE1KRUJ6ZW5JU0V6SnRWbzJNbzlQT2lLczlIZ01Hcy9vandSSGpP?=
 =?utf-8?B?TUttR2d1NGthWFBtNGhoYXM0LzFLSDY0M2plWmFWNXNFNnZLc2EyNk1EVFRy?=
 =?utf-8?B?NTV5N09VSnJmWUQ2eitNc2pybXZEUHRsakhRRDdjc1JtWTZzYXNkWm85TWdV?=
 =?utf-8?B?emxadzlQR1pjczArT2JsSk95OEZidHlTSWtRZlhickRualNOS3FhQmV5S0pG?=
 =?utf-8?B?L002dHFXdUdhTWVKeEhaTlBHdGZvT0Radko2TS9ya3VQZFF6NGlDcTFabHV5?=
 =?utf-8?B?eHlTTlU3U1M2QXk2MGZNM1FqMk4rbFo1UE93SDdoU3F2SUswZkJxSWlTVzB0?=
 =?utf-8?B?Y0tBSVRFRFB4MUNjS2lPanRhVm5JdklZdG1lUFl6UXV1QUwvMTFZdVRDVlp6?=
 =?utf-8?B?YUxYdmN3REU5WWIrL3pVTzB6bTRzYW8yUnQ3WGNQODdsbmtVdnZLL24rWVA1?=
 =?utf-8?B?WDdMc1pWSzZqRTJLUDJ3TXBQSnFwRDFuNUROWU5wR3RIQXdvcEhiMmJuZUdT?=
 =?utf-8?B?bmttbm91c0t6WDJZVFFkeEQ3QW9PankrZnhvQnU3bG1YZ3FqMTBNSmc3dzR4?=
 =?utf-8?B?YWxNZHZML3NDclYzWVdTYjNtTFE1NWVrN3RhMmUrby9uSThzTDJHenkraWdF?=
 =?utf-8?B?RjFkUFNMT1AyNTVvSGloMlFWRXhWL0hnM1JBZlpvZ1VVMmxiaTlJM0l6YWJB?=
 =?utf-8?B?bTV4alVYa0V1N2FNc0hVb0NsbkM5ODNROUFQT0xESnZTcWg4c3E5aHI5bVJj?=
 =?utf-8?B?RFJLRWY0MUNRLzZjWnVpbjV4TnJQeFBETVZnV2YrcitlalkyNXhEbUhHMk9v?=
 =?utf-8?B?QmJ6TkhvaURlUU9DT3VIZFowYjdYNS9qSlFPeHd5K1diU1ZpdGlwMWdpQW55?=
 =?utf-8?B?NldMRndxY09NQ3RWdVpFVjY0YVlIWFJJZjNUYjZKZFVOckk4bjdjL1FPRmF2?=
 =?utf-8?B?TFdUZnZ1aHVQWis3YVZORGIwazM3YjA0cFFHNGQ2dFhxV21vakNiN05hckhQ?=
 =?utf-8?B?bEprMVN3Q0ZjbllUZnFMeFd5L0pyOGVVazhyelI0eW1UdXpoa3YydXdjRGNs?=
 =?utf-8?B?aXI3VXc5QW9uTTIvNmM4U2NVVWcrYUJHNHMxc3V1RTY3U1lhY0Q3cjNlRmM4?=
 =?utf-8?B?ZWRPUERIM1dIZGhsMnJFMTlucWlJbUhhS3EyREV2eWhVektkMDV6cEtibWRk?=
 =?utf-8?B?NW8vbTlicmh5ODlraEd0TG01L2wrMXcxdWpsZ3NHa0tvMkgxTGZGSThwR1Ry?=
 =?utf-8?B?NUpEUVVIUkFZWDI1YU1Kd0JJLzFiWjdScjJFdlRXWmV5MS9ZWFJsM24yQU9p?=
 =?utf-8?B?TWVEUkYyTmtVNFpuci9mOERQR1RYM3ltanc3OWU0SXp6eUtnbGRCQ0U3VDdK?=
 =?utf-8?B?TllucWdoZ09McEthZldCa2FCZTNEakMxRFoyaXRxT3A0djcwa2QzcFlnTXhw?=
 =?utf-8?Q?upE4PTIOT8jQBp2FT4/u3HE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1hoNVYvRnk0VE9zbjg5cjdGUVFGNXdIYzZKQktKS2gwNXQrNC9oWVRQK2to?=
 =?utf-8?B?TFlaRng0U3dwT0c4SVhJZUI0RjNwVmhpSmdGdDNjclNGa2JLcXRzdHhYUC9J?=
 =?utf-8?B?a2hEU3ZuSExHS2R0ZEdGTDVYdUJjK2R5ZVRUem5NT2tLYkMvSkFkWUF0MHRQ?=
 =?utf-8?B?YkhkTG9wRmJWN1h4UnYvUGJaR2hCcmFCTjQ5VTFKWklRVmo5cThBcThPdlFN?=
 =?utf-8?B?Mk82NkE5bXlHcmNINGVZVGVZQWJ3NC9hTFB4UUJxNzdkTmR4UVc2VSsyVGU3?=
 =?utf-8?B?QzEya2QxYXd3ZEJLR3FmemJsUS9DZUtPdWFtcEFwY2tZNStjelk3RXZiUnht?=
 =?utf-8?B?bnpKRVJ1bnAvYkIxMFhFU2tFMHd3V3lNV0hSdUNKbmN3VGFrUDN1V2hvb0U5?=
 =?utf-8?B?RFZOWkc4aGlybzBGOHd3ME5lNDdoVGdnVUI3Y1FSRGs5K3ozSFNVNERHUzN0?=
 =?utf-8?B?Wk1qdW9EdVUreUR1UTdscVVSZzhxUVJCdVQ5S1krNVdhdUVGS2V1Z2lGYmlZ?=
 =?utf-8?B?WFp0ZzRIMzdrdE5WNWtRdDZEL2JiZnZVVEhUQURTNzlsT2dlUXNOVDFtNE04?=
 =?utf-8?B?K3pxRFdOSFN5TGRCRVFoMnE4OHZCczVST3g3ZTNmSG5iZkdCM1ZnWmlHS0pK?=
 =?utf-8?B?TzBJY3hPeGR4WkorR0dlOWIyS3RqTTR4SHNnZmdON29WV000ZVRZcldrM3l0?=
 =?utf-8?B?d0dLT3JtRk9ZRFMzbUtHU1BIcEltdTNHQkM0MGpjQ2dackpqcW9uc3VLNXVp?=
 =?utf-8?B?bkxmYkFRU2VhRHh1Mk5sMCtiLzFkaCtKQzN2T0NRMzZWbGtLamFSVVdCL2lq?=
 =?utf-8?B?SkFRSHpmSlhVY1FFN1VWTEtINVBJV0lQS3B3L2hJazc2UDhTNHc2ZlRmYjcv?=
 =?utf-8?B?NTNydFJuSGF5MHJWV0NSbVlnN0V2UnA4dlNCUE1NalU1em5DZnZRZVJUbi9i?=
 =?utf-8?B?Q1pSd3dIUk44WXdEeXFiaU44RDc5L3VwdWtXMGRuclQ1YmhOdWtnOXhsNDJn?=
 =?utf-8?B?aHhKSGNoZ29WTmJJZkpPZTNRN0c4VnFqU2NqYlFFSVpickZ4UmdROEI1VUc2?=
 =?utf-8?B?c2JERnNHTk9PY1ZFQXlEVHZZYXE4Z3lUS2Z6SU9Ob3RkMWI2clhPQVhoOWFp?=
 =?utf-8?B?VDFwRjlMT3NvTFJZb2NMemRXOHB4MHN0VS9SWlZJQjhYZGNjRkRnY0pHNjBD?=
 =?utf-8?B?aUF2bFpYbExqODZ0TUFHK0lUdTA0VENiWHpVcDJqdmNhR0JxdnA4OE9ScDVu?=
 =?utf-8?B?WVFDZXptbm9vQ2xyc1oydzZxM0ROWklCNGkxZVhKNlBYdUlCQUo2VXp0a2x2?=
 =?utf-8?B?MTUvYXpTdllRc0Iyb2k5S01qVlVJRkVHMzFIVnZaT2d5NlhZWHFPTWtocG1n?=
 =?utf-8?B?OWlIWXpZa29oNGcxNUw4cGFwWEFCQ0h2d1QzblFVRDY3V3BOL1hRQ3FUSkRS?=
 =?utf-8?B?THNNdHJTRTZ0dGwvTUxrQ2tXcnYwZ1g2QjJKVkFnL25aaklHL1VLbWZZKzFE?=
 =?utf-8?B?aW90MTFjdklKMG5pd29abjI0NmQ3VHk3NTZYOVhlREthb2x6T1VWNHlQTGNE?=
 =?utf-8?B?MnJNaktYQ0JjNkNaKzBid3dWWnBFQ2d2T09tNGw2ODA2MEJFRStVbEIranpT?=
 =?utf-8?B?MnBDOVdIMVl3RE9OTjhWRVpCendEaWtVazVNRDdhUDdJVmlNSUhyNzhzY0dj?=
 =?utf-8?B?WlhQS0VlMnFsQmMrY1NmRjdPZ0hSY203M0xIRklwWmJMZmF1dG1uZ25ha1Rk?=
 =?utf-8?B?SW5vUmxWTE54L1ZzY20vR1ZHazF5L3pScENvOHUrNUhUWFFDUGxVMjh6bis0?=
 =?utf-8?B?aE92d2Y1OFpneEtibERDYWZjWGNUWjJqR3Q2ZzZrVkxhNVp3K2t1aVJhVXl5?=
 =?utf-8?B?RXRrTHlPYmtINDAzbCtvYTBxTUI0VERaL2xtK2RkOUVGWnhwcXg4UHZBanVJ?=
 =?utf-8?B?QmYvbHBmejFpNW16M2krRXZWVzBMTDZVQjZLNHdTQUhFUzdrUHA4UGNrYm14?=
 =?utf-8?B?dXlVbnJwQkpGelI1SStDS0xXY1BSZnlRNmF5S3MydFN3RlNVUTlJcmp2VFA5?=
 =?utf-8?B?OE5PUGM2azBRU1dUd0pkQ1Znb3YwQTQwYzkzOGN2V0Q3UVQvTXB5UC9lRGJJ?=
 =?utf-8?B?cEJRUDBTZDgzcW5WeUJkRjFIOHIzOTQzblVQWFJNYVYwZVc1bEkzOTNqMnhK?=
 =?utf-8?B?OUEvUmNjVDBTZ2cyN0p3ekh0ZS9Jd0FFR2RWeTkxZllxNnZCdVZMeU1FL3J5?=
 =?utf-8?B?TGdCTGx2T2pGNjFuQmdabmp4RS9WanRaVmkvdmN2T28zcGd1WmVaY0JucjdR?=
 =?utf-8?B?OEJTZTdVQUYrRzgzdW41SWNYTFFpU1B4RVBQTTNlOG1xZW9kakNzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53E64792D1BE8B4AAD866D57AD101403@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g+vvzOFyiTdfsoe3PdKKgVF2RKUu52LT6MCQAjs2LdWdE+5jQAOKws2nZTM+I002qGstsHMIhlBPCiuhGYTgq1EpQGunm0ahHvwWKBcfJku2m2SYetgzBIJfnsUvqmmFHSwex+Rqcn5zMFPyI9/u60xT2iY7NTUrae67oYDLNSvyrcAiGGCDgp6pOE176hno6Su+B56HoQ/be3biFGvD3aZHNfUIMRErIuQ/cGr8HAgPgleJNgGUk3efKPtuV5RH1X/9GoTD63rkTzPtxBH/rM9AjZ2KDyUBxyo6rfUcKA+4MR7CAD+lgzHi5FhtMPkCrL2z6lzcIBH2/T4gvjOj4xqnJs3xLyXeuDE4ytOPZjhFN3cBpffoghDQSP19xuR7rQx7tG0SEFQGN+n6mTuBcpt6z+/B7MuSE+2PEoEN96vbdNFmZqfPfL2//i9/ZenToqi68dlQU1aApLJBAARC/flOEmPpzxagz5HdXWcWo7Ryyw8q+pqnKXARqEDPLHxuiuGWpythmWO2d06LxTw5PIO7JTXHwihSKIZAcSg1hUrRCqOGNvH6zJpdXZYLQzu7nfUU0Mk0ybYnMvCIvFQYVSurWrUoVnuNEFiMy+SyKcExELqVmdW5tT9CYIddMrSQ4QExWfjGaV6WMo8u3ToF+Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb82247-42b1-444f-eca4-08de55253249
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 17:32:17.8922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XT5mcxWvwB+RZWpqsEs1ansWsD1Ua9LXVkwRtTgGrmQoaa5R20yZMS3ZwMPrBgXRatIFJXjtRqtKbsdnRu99lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592
X-Proofpoint-GUID: JRVNxvu2ux2hAeTat1BZvPajNzQlcdMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyOCBTYWx0ZWRfXzsR52SyLH2uY
 ie4PFWNNcvncppGZ87SATe3S/cXfaFDQipjX7M4LM3sgrRy/I1sh7F6vCQ/Z2xNxkJrACCTFsyZ
 aBV4rRUmZ8HuXpGSLhzQt0jvih4dwD9ILI5yUwSoniAZxXgIk1k0ktqKK0HqnH9pCHgzsMe/6Ri
 z0yjZPx6Aj2JKMoQBLIvR/zFUkPxvTV6n8hkaz/m7igq+O58ipI8IOWvDzJX50cyUyKuXsUCo7P
 tTbhfM2OC+jy8/uIizRffeKQL5ayf+sGpk2fruqyGVHF9wa3qZn+E55AWEw+XNFOzVshzDBcuEU
 SJFAozGXw6iWNEvXI6WzFYB+A8AtHwXrmVvtbeTXO2GTz2K0hIIhT/U4FVHa1aXiWhU2vE1wcT6
 97luM7nS+qkiGCbUv4qdjADuorEgGH6WQQNXZliBNJ5WKrQwfAlGE5KTs7m5bg5JAesT8n86yOb
 0029lfGuSzE2VBCHemQ==
X-Proofpoint-ORIG-GUID: JRVNxvu2ux2hAeTat1BZvPajNzQlcdMk
X-Authority-Analysis: v=2.4 cv=C5rkCAP+ c=1 sm=1 tr=0 ts=696a7634 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=-O98AY8l4FVp-UxMA6kA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601160128

T24gVGh1LCBKYW4gMTUsIDIwMjYsIENoZW4gTmkgd3JvdGU6DQo+IFRoZSBwbGF0Zm9ybV9nZXRf
aXJxX2J5bmFtZSgpIGZ1bmN0aW9uIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yIG1lc3NhZ2UNCj4g
aW50ZXJuYWxseSB1cG9uIGZhaWx1cmUgdXNpbmcgZGV2X2Vycl9wcm9iZSgpLiBUaGVyZWZvcmUs
IHRoZSBleHBsaWNpdA0KPiBkZXZfZXJyKCkgaXMgcmVkdW5kYW50IGFuZCByZXN1bHRzIGluIGR1
cGxpY2F0ZSBlcnJvciBsb2dzLg0KPiANCj4gUmVtb3ZlIHRoZSByZWR1bmRhbnQgZGV2X2Vycigp
IGNhbGwgdG8gY2xlYW4gdXAgdGhlIGVycm9yIHBhdGguDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBD
aGVuIE5pIDxuaWNoZW5AaXNjYXMuYWMuY24+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9k
d2MzLWdvb2dsZS5jIHwgNCArLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LWdvb2dsZS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdvb2dsZS5jDQo+IGluZGV4IGExOTg1
N2JkNmIxMy4uMjEwNWM3MmFmNzUzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtZ29vZ2xlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdvb2dsZS5jDQo+IEBA
IC0yMjgsMTAgKzIyOCw4IEBAIHN0YXRpYyBpbnQgZHdjM19nb29nbGVfcmVxdWVzdF9pcnEoc3Ry
dWN0IGR3YzNfZ29vZ2xlICpnb29nbGUsIHN0cnVjdCBwbGF0Zm9ybV9kDQo+ICAJaW50IGlycTsN
Cj4gIA0KPiAgCWlycSA9IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKHBkZXYsIGlycV9uYW1lKTsN
Cj4gLQlpZiAoaXJxIDwgMCkgew0KPiAtCQlkZXZfZXJyKGdvb2dsZS0+ZGV2LCAiaW52YWxpZCBp
cnEgbmFtZSAlc1xuIiwgaXJxX25hbWUpOw0KPiArCWlmIChpcnEgPCAwKQ0KPiAgCQlyZXR1cm4g
aXJxOw0KPiAtCX0NCj4gIA0KPiAgCWlycV9zZXRfc3RhdHVzX2ZsYWdzKGlycSwgSVJRX05PQVVU
T0VOKTsNCj4gIAlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKGdvb2dsZS0+ZGV2LCBp
cnEsIE5VTEwsDQo+IC0tIA0KPiAyLjI1LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4g
PFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNCkJSLA0KVGhpbmg=
