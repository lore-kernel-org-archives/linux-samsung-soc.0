Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565280;
	b=Pd/csjuxPm6w2oL0uHKEkMgcnGVOZeGrxqIwcNyhOBGaNuzw2yi/Q7XPiz6wQYKhXHem
	 lgtuxSvECL3vV15AFCzqv0bnQLk5G2hbn4GEX2LGybVCHZwka7OtmNsxKFuWnbLodT86i
	 S7PZIjESzkDRiAmPUedO5wZiLtddik2/nTUOPflOir5H5lYo4Er53LSKFZdFhOmo7OwOU
	 sRG85/ivIahKyDJm4Y4Yex0SaLI/My8YGqLCZOehV9lGXWNvo+8T9nDNOLMXGDUuwHVtY
	 lAxW+NIBcChu6ejaJQ/a9Bi5TY4i5GNEaI7Mxsa4ar3pt+fyEpz/t6RAgL2hoNBScPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565280;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FGKPA3MkEgAGFLbRl+EjDmGWqlqn/VM25hlpMpaYNsY=;
	b=3/f5dB9BLhLhSUt8yX1yxYK3zfD9j9Wi81vIcio7KXAQ0FmLQtbbgdDs2NwezttknsUv
	 vG6Rf4nFvcm349x9hcKg/+6sF6S410ptDIP3/5VMFr5dmVaKy+pIjs2CMTvTBk0UeyWd6
	 cxuTO4g/fzuFcZsvm0UQMRH/Y7fYULRGH+9ZdHPXXH8ep1P6kkHLv9RpTHTPN340zYHKn
	 Hh1pxpc5HzlTvG/brmHE9sNn2AfYdAKTL/jcVySL4yvWEBI4JcvmNtDvORdt5j2hwJ//2
	 oWl7qals2oZzRoZ2YQ+omgjcZgQpxZlbWBifuc2QqrUcDuih/ccmfHv5jvFW+Nt4FmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XA39V9Fh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.11
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E94F606A322;
	Wed, 21 Oct 2026 06:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E94F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XA39V9Fh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gA/Fi+TTb7RJNzBNlIOO6S48AdemzQVP16GhkRxbqTk9Uu9EHrUYlCFy7TO1cjpSPYdvd2Lbf86emfWKOMhhMd6ijo1hQuXgHCIVQJmYphXtinD+pyvoiRLHeu11FR2vArwPBGHkgfh7vtlDb6Nh1B4Yh84zCHwwCr8+HdzPaziW6OWlVvW/FYTZg47tnzdZewCv9T/wS5J8x3CcbzkTdwHXp6MWViZXMzic7nlwohILktQuK2eBLpZaouxdc2YlM2M3Cq2437MYY9mUnRBbjvVQPoGDA83MuTLVfynyx7Fvf4pXSCs9D6AB98CAd4CykTuH4493Boi7jZK2V8uFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGKPA3MkEgAGFLbRl+EjDmGWqlqn/VM25hlpMpaYNsY=;
 b=CyhSRohyf6e6m6tXARm0DhHl8IoIrvyXKX9Jp53YTq4ZRhwMlsspRP5cKqGqSGX6soa/EvsCO5VXvehTpu6BIKzaWPIPVcwBpeMWRRyr5p9rvBGzevUju1KZtWTodbVdHuCZhbcYCvvEoSpX8OTtTB+NJHIaQa4m8ft88SbDXnm9O+MU0Dhaz4ZR1E/fuVcnEtq+8ONUivxkDmmazidWh6xv4WpIoRqFoJep0nTEU0GtWnLuBocLO4fh4Ck9/xqkPG3qkyXsH7r5XKeAfPJlndZLXBwX7a7voCRK0vx2SPh/aJyM3psFMKIQ8vzMiCh3dXLypPjoo8U6EJ4gctiXyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGKPA3MkEgAGFLbRl+EjDmGWqlqn/VM25hlpMpaYNsY=;
 b=XA39V9FhzfdLuRu24weSpzq1kTUG1+db6LHdJT9Easjm31+Ygvqr+RU9EV1ZQZzJeGGpnSgJp4wP7oHZL9lshUwaywDZU0n6WJNi+m6lfpTm9IKG/Q9oO3+QzQVJthcWrQjt4LZbvLjq6ydqw/xWdFzysVB/g2PGRL5jR3IRyaY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 21 Oct
 2026 06:47:57 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 06:47:56 +0000
Message-ID: <3142486c-9604-41bb-b7bd-d0708643d41f@amd.com>
Date: Wed, 21 Oct 2026 08:47:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image
 script
To: Douglas Anderson <dianders@chromium.org>,
 Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org,
 Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>, Saravana Kannan
 <saravanak@kernel.org>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-samsung-soc@vger.kernel.org
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2cd1bf-ddf1-47b0-cd58-08df2f3f3ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|6133799003|22082099003|10067099003|18002099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qA4VGlOMiYUKr57aHWtO9K7Mdl6rAEkiIOuw6g6WtfsP7UpcyCSymZyB7DyzIQZW+5h6ZaA+uYzmUcWCYonX3j5cshSP73ymoAOa1qBERuyowvfHi45ndZPAbwBQHB/f178MjBQ3+E/obP6RjSFon5maDN+5ImpYgJjE5a1A4xPC/vuM7GeaATuq8Rkx5EL2nGMUZPkTXLDADPexFa0OXmLaHr0SksmugeUWMnDyVnXilqUgHFAzuUsPB9BfXL2izvOnM1vbX+NMlOWwaC9PmvNjeeoeaUZs6D+NxfN+JgRQgV0iIY7aA1mw9DFIatPvSyqsgdr4oRSxT2MGBH7RlW3uJWrGWUYTbVALdDb42nya6JtK3L7JVZNqttYFFRGCjgfHkXUBz6znH+bHhZEd8KegJn8ExriDijf2aQK9p0FDXSYYWVEVM46caN9LzoXmFoTP+LC0JkXuGAP5CVldT0izn2lrz69EqaxI3RLNGiHIZXfQH1sfj09mhBdklkAdz19XS+BfCqcvfEpo77SA2WWiy8RXZZ34SmgtygzbrGyA74k4LmQjLPmGOHj5zB0rtfcklu3Bs8dtaML6dwRYC53mcpvxXxzj7BAw5t/GvHMdN2Hujgw3Vm5DHo7dW8VGd/UE0BNXt0zVJCY6zJATbfbdzzVPPI+mKp3CRme5GeY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(6133799003)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VnclFoK3VQVkV1dHdaWGhzKzV0ZGpuWmlTZE9waTdSUGRXQXJvUWxKNHVt?=
 =?utf-8?B?cnQxVmoxMkhwclhvQWJQdHdaNm8wUXNTUzRnbFlNOFp0akYxOC9MZjNHbXVM?=
 =?utf-8?B?VUo3NVRlVFZWZGdwdmRDZzEvaHU0QUIvQTZBYTU0UWF1VmFnVzc3ZlFvNG5Q?=
 =?utf-8?B?SUk2VjFTbU94cks1Y25oajdibjFkd1o3MncyOGZXTzJWbURReGZLQ0dKRnFy?=
 =?utf-8?B?V1pBc21SVmQ3WEpYOWNjQS9ZcXl3NGU5VlNNVUYzTWNtK2JBcWFOeFI1NUNl?=
 =?utf-8?B?bkFOWEQxSlVSRk0rRWJsaVZYWEp4S0tUQ3YyNm85SVFZMnVKRjlmMi8wNE82?=
 =?utf-8?B?ZENCQkZqc0lTZEk4LzQwRGM5aTZCZjBVNEJkWVBJSUNmbE1RU0IzSlA1Vk1r?=
 =?utf-8?B?ems0RUY1Tm1RYUJlREwxMXhsMXd6M1R2c1dTWmJLbnhmWDVLb3RjeTJpU1V1?=
 =?utf-8?B?UWNMRThxMWIzR3ZxRjV2aUZLRWNEcTRucGdGcHBKNUsyd3p6eTJPMEpzblJG?=
 =?utf-8?B?UEtZYUU0VC9oTDRhWllWWWc2a05LRllJTGMrTjhud2xOZXppWldEa0lzUWZt?=
 =?utf-8?B?MjNIN1VmUThZenJqSllqOHdubjhxRFJqV3ZNbzlydHNLeFZkME93RDNURitj?=
 =?utf-8?B?bWNUMjYyTEVzU3ZoQTRadjYxcUpWdGw0R2ZjQ3RxRHZGQlJxdlM4a3NsMHB5?=
 =?utf-8?B?UHhVVkU3V2ZkdjduK25kUFpDcFMzV1JLd0xTWHZSdWhaa3lCbmk3c2VKQUtj?=
 =?utf-8?B?STlIc3E2ZFplUU9vREpObE8yREpsOUlFVlBVWTBEdUtLRUU4UXdLc0RJeHpy?=
 =?utf-8?B?YkV4SFpENTRQblYzNGl4M2s2Y0d2cHJ1eHd6Wm1TUGxDNFRRM2FndTZBNjhp?=
 =?utf-8?B?dFV5aDJKY2hIZXpTeDhMZkxxcSt2UlpDZ0w4V0k1Mzlma25zNDQwSkFYMEhN?=
 =?utf-8?B?MVZ6bi9LU08ySW81WHVFdXFtYk5tWTFpdTk1Nk54VzQreko4SWRpOGkxNmNu?=
 =?utf-8?B?VVdDNUNVZks1NnlkM1JkMElBOXlFallCQ2U0NGFPaUo4OXp3MWJHQWdnSWVB?=
 =?utf-8?B?dHlVUXNtZ3VqaHBKVVErUEhjZEZ3MmR0Y3E5STdIK2xKSWNYaDRmNFN0WFd2?=
 =?utf-8?B?TXBlb2dYVlhqdnQwQVBhMzNqSWdvZHJIUk1sL2VDR0hiSUFCMDBYNmlyQS93?=
 =?utf-8?B?UVlqYURvM015bVZ5OG5NNkhvMlh6NWlHeTZTclFzZjNVZ05DYldhL0pCVVFm?=
 =?utf-8?B?NWo5U08yZXB1czc3RS9SY0RjTldnWTZQNlhuK3VsdlJ2REc5UmdsWVUzZDJi?=
 =?utf-8?B?Z1IzYldDQTNhd0ZoOWpsL2tab1lQL0RkOTZiZXFVMVRyYTJTaWwvVXpNbG1z?=
 =?utf-8?B?NmdoZHc3dUZaTUdsUTZHQ3JJRGdJd2tTRUhGbythY0dFSEFYQmg3TnRmK2Vs?=
 =?utf-8?B?SEZBMWdpMzBCWHRRRTN4QXlPc2h3T0s0d05xQnNXOEFTTEhiN2pNWVROQWZv?=
 =?utf-8?B?Y0pzaWxabGRWMUpsbWxWSnBTeDdPNm5jUCtBQkdVWDRXQnBxS003dlFvM2Q2?=
 =?utf-8?B?QjA1MURqZ1lhc1MzaHRJQ0RtQ3E4SmJKcEtCVXViQTliOFNxVHhRVEdqa2E4?=
 =?utf-8?B?UXdXS1NUYnZRK0FIQUM1SGJtTlZWNnAzMHU1MHJTZWtKUGFBSm1UOVhFbkwx?=
 =?utf-8?B?VERGR0xneW5RbEhqeWE3VVRMWlBsSXZjajBCRVFqWDZTOE5zbWtvMVBXNnFF?=
 =?utf-8?B?SUNrdk8vdEwwNS9raU12MWtzbCs2aUhwRUdsRjZhOXpZaEY5RmxTQmdpUHM1?=
 =?utf-8?B?R2p4YXErb0tPOWxEY0RTTFROV1d1aTVCS3BURWJScGNRcWYyZEl2dU1vc0Rl?=
 =?utf-8?B?ZmR5T0NDK1YrejVpMnZ3VVZNcGd6Wjh5VmRTdTFoNFp0M1JUL3VLNlJTOGxT?=
 =?utf-8?B?ZHIzMU5YaVdQelppbkFGdHZZUlJBbDhXOW8rT2hRck9NL0tQNTJ2ZWN5ZHhQ?=
 =?utf-8?B?Sy80M3FXaDB0MFNuWU43VHJpTk1wQ0lXOTUxeXNHLzZKVkZ3SkNOYlJ3Rm5p?=
 =?utf-8?B?dEoxYTlYZDlKakpQT1loR3lIdUdKMytoVnU0Znhwdlg5OWt1b3R2THlMcGtO?=
 =?utf-8?B?SDdsY3NRa0lGM2xYUXlXYy9pcGxZd20zK1oxZHdYeFpkemR6WmdVM3JWSVlo?=
 =?utf-8?B?NlJLTWxXelpXdjVmZC9CaVRzREgzSUsrWEMvSkVacWt4SElCSHRRVzFkZm5U?=
 =?utf-8?B?RW15WVQrMXZSUVgyaGhsZjJDcml5RVlLQm9KVUFhNkNCVU1CYnhwVFIxTyti?=
 =?utf-8?Q?Uq1kqlYGmMNOI1lx0k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2cd1bf-ddf1-47b0-cd58-08df2f3f3ccf
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 06:47:56.0255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcaE3s1tKV3cMml+2Ck80G0BqZs52X6vzulxIPE3/hTHqkGOjNEFviJvazt3iWsi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275



On 10/20/26 17:35, Douglas Anderson wrote:
> Add an Image Tree Source (`lga.its`) describing the FIT image for Google
> Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
> `lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
> metadata in the configuration descriptions, allowing the LGA FIT image
> to be built with:
> 
>    make \
>      FIT_ITS=google/lga.its \
>      FIT_FACTOR_DTBS=1 \
>      FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
>      image.fit
> 
> NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
> image. However, packaging scripts will be able to take an image as
> built above and convert it into a format that the bootloader can
> handle.
> 
> It should also be noted that the "description" of the various
> configurations here is expected to be parsed to help figure out which
> configuration to use on which board. This idea came out of discussions
> at Linux Plumbers Conference 2026 and means we don't need "loader"
> info polluting device trees. Having a structured (and upstream) place
> to store this data is part of the motivation for landing this FIT
> image.
> 
> Side note: at the moment, the Pixel bootloader can't handle picking
> overlays based on the soc_id and soc_rev (it only uses those to pick
> base dtb files), so for now we won't be able to support boards that
> might have different SoCs. I've included the soc_id and soc_rev in
> this FIT image in the hopes that we can improve the bootloader in the
> future, though.
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Note that building `image.fit` with `lga.its` requires the Pixel 10
> (`lga-blazer.dtb`, `lga-frankel.dtb`, and `lga-mustang.dtb`) device
> trees, which are currently in linux-next and not yet in mainline.
> 
>   arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/google/lga.its
Looks good to me.

Acked-by: Michal Simek <michal.simek@amd.com>

Cheers,
Michal

