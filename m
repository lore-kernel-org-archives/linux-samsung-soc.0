Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369F4C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 13:06:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19C37611C7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 13:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhJUNIf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 09:08:35 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:14301 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhJUNIe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 09:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634821578; x=1666357578;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=za85osGaKqt8/5qA0o9saSgltgMsqxky5GJBqipRQBU=;
  b=oik6nOZrHi03qDeNyWaUf3y8JfQLxFNqXuR0ucHuruhZfIF8pnnIqath
   ow/BS1ZZpLJVd8d1Qtr4oel/35Kwo256ySKufCTbytgVhbBSbWp2+I916
   8GpxLFRrBs5dRUQYBbwzaQBLdbiDz+Da+JujNz8G2sm9enyRwOODBHrc5
   rLlOmq46ZQ60G0+IYOJH/jXVwxI2YHuyXnfUOfqxbWVbGkarNsTlj4Pm9
   cdNdXSS8VwUwPB0rpvXHfUBNZs0AniW2/CC50gjSSNLrh4gmCn7+nM27h
   l/N6h8aXlREGEcN1vTe2KEDk0Dst6KOjj6O45FxQ4I3RYrKpBFBhbhxAO
   A==;
IronPort-SDR: SxopK1SYgpVuxMKt124BjwT85q0sS+R5nNSW1Kn/I+FxF2NXZ0POQ0j1CGcB+GD/0DIFy1JNHo
 E7tfli2N7rHS9cXTntZBE8CMINPcnvdYTDGjzaH8P+pYULEgyozERM4CjD0MlTDSNreBmHzxnR
 q93vevzQbrn+vKSnigU/5olUM9RE427haBlQx6ZngBgEZohDU0A1kUT0dMbe00QNNGqFydLPs3
 yubJ+6vxEaXu0JGy24Twlm0CdL5SZUQKANlfsWbDRLK8xvID7JaH2MJssr4EKdxkQAV7UnXnqw
 NFuL7YqzGbnrYCzU2tC4JOxe
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; 
   d="scan'208";a="73828239"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Oct 2021 06:06:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Oct 2021 06:06:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Thu, 21 Oct 2021 06:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Clhunl4vlnZ+4+EfEB7fu+0Mujm3Stgv1qa+sEuiI+8j1QRc3Eep/ptNUzI3uYMIj3oUtQWKkaXy9/36ROy7eoXED3uLHPaJ5Dl6gBlGedj44ihXizE05Qnh3qkUTXRwfrb5JMOeJ5vJMVkwPLrT9/d/BkgNgSLKP8ZvkrRHHlu3kxf+Bplo5xP8OMXTBLtcTJPg5B0pcTA6QCDJ+r1Otlqy5EMEyDIxKmTr1V8Mhbjf9y9BmRJk6iyZSc69aY2YVmjdS9ahuYp1oiF/pPh8qMHsMXiT7UdUcRF+DV1LrXz1EMPTvgiJqUp6BAej1ArfZPxbTpSW+QV2enBQD7BZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za85osGaKqt8/5qA0o9saSgltgMsqxky5GJBqipRQBU=;
 b=cmwwVeeGo7cYSOIdjCazUHwOriLiIGTjhlnfxh+0rgdwXMYGQMKgvvlW25Ks4I92uvx/0q+tqrH5YPpJmMeplmI97BjFSIJTXYfnnyNqV8becBSofylekpEFm892aZSyYXoZas/IxtMoJK087d0WxE8h/H0d5GHBuPdBj0V+U38IGuPCp7muNx59nKpcuR/9OTTvV1r2Ok6hWLv7OYzKwyRulx5DEt521I1xE5/mKteAJ8hE0vPCUu1mLRruoG5HRAgtdI4xJ08S59ZIRAs4h3XiPkb0KY4t6MkaEEYu5kWsLFe2fIFmyM0TP2Bi4h2dQVWCmI/SwQLdmQT1LqpSQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za85osGaKqt8/5qA0o9saSgltgMsqxky5GJBqipRQBU=;
 b=afWH9Kkcq6YV8m+KmyOPkMjb+WAvl/QNp1uB0fSn1x7grmGqySUMCcpHaBZGmrpCqqz7RMc1ikR6jDQ8KkOz9FJDuILikWe4xsP+PGzrMz4WeGsOzGMO9rBsqnfMGZ42bv0M/IlstgBzj/MaCISDlFgC3mQHQiiyLc9PrfEsMrA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 13:06:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 13:06:13 +0000
From:   <Conor.Dooley@microchip.com>
To:     <arnd@arndb.de>, <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
CC:     <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <krzk@kernel.org>,
        <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
        <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
Thread-Topic: [GIT PULL] riscv: dts: few cleanups for v5.16
Thread-Index: AQHXxnalOWJGO47LnEa7wXckSoIxyqvdbBUA
Date:   Thu, 21 Oct 2021 13:06:13 +0000
Message-ID: <10f5244d-ba2a-33eb-72dc-77b2a7a0d101@microchip.com>
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
In-Reply-To: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90c9b904-42e0-4c6b-e749-08d994938f24
x-ms-traffictypediagnostic: MW5PR11MB5859:
x-microsoft-antispam-prvs: <MW5PR11MB585963B0383193AB13203CD998BF9@MW5PR11MB5859.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vUBt7YlZNgT0VJ+X57OMJMR5EJloevMObD2B3GVOUyeO5R5PS98Ku1rHgb6IzBeDug+i1oAGxMaaCeOJ3MPUlSibeivObIpydjQOJLnvruYd+iw+kNmaiwot3oSWNbbcykB5vamAM0s2vGyX7jRT8j0ImBaI9PTxzg+WzgZGTUVSK1e37u1vhikUgtDzhUJ0hJM9PPP5lrKf5m6+d7+GeAG2eMkJ8GZXWrcDJcTKGCXu+PTxddDJt8umtJgB9nE64dpg5V687jPi/wGvpX3Lyjlx4IA9WSQU571p0kdeJsiD549XdZCScXSVpjJbrXkQ0o2C7Wq1Tev7fkhYaudBpauKOwNBcVAseBUlzX/KK/QMnYk3h12+NTwFRixsRBZ8aCv4oWszZBZy3DlSpZv0IpOeaSI7q2ZbxCr0HGOjhIe6MifqFGZW83S0hTXkH5DawQHK6h5hqGdH89+TfjwO0ISbWmXlT+Mc9vnq5KaSPc45SfcBKIvoHrVgo/tyrNOquNq5NZdym28cnUP0fxo63TMtUGoArWCCTjVANrGaj/xi+XWHJeoa6bwM+8dFR/Z7bE0mZCu2niWaWO1s12SJkns83f/bU3BRyxTDrYQVMvqYUK04YzqjNw+Xqw2KVSyw/Y0Xw8PznZCWAkBpn6rqdcEF1hywy4p3122yKvpv1RRy6dky3tX4KdSMNMzVuy1bkSlwtjnoRoD92CS9UJjDzkkdVzbJjn1QGHUnDROdOIJXkMsSAMAXxyMCqRa3H5IP+TWY6kJZy9D6sXtzqPcAqxm76hvxGP/a0DHLrYPrK2DYtFMn/YD9ZT3G4/o8AooylfBj7n+/VZgmTnLPdXFNqModSgw6Ovaeeu6iqo1YdOo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(53546011)(186003)(5660300002)(508600001)(36756003)(6486002)(8676002)(54906003)(110136005)(86362001)(38100700002)(7416002)(122000001)(316002)(71200400001)(8936002)(4326008)(31696002)(38070700005)(83380400001)(2616005)(76116006)(91956017)(64756008)(66476007)(66446008)(66556008)(66946007)(6512007)(31686004)(26005)(2906002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXFYODQ3K2pPRGp5alBtUHRVSktzcGVkZ3Z5b1ZZZmNKY3NsVTlObFYrNXMw?=
 =?utf-8?B?eGR2ZktSQlVodFg0WVVNZEN2UVlNckZMZmpSWWQ1eWtQVVhBNEU4RUJhZ1hN?=
 =?utf-8?B?cjVCckhUR3k2Q1RtaU9xeDIzUVhOR1lTVzBEZmlJbkZJTUI4dVdjcEViS0xp?=
 =?utf-8?B?elQzOWJQd3B1a0thNWVqeWtJMHRTVG1hMlRGWnIybHI0RHVlRjlQVG5uZEky?=
 =?utf-8?B?QTRPWEgxeEFwYzBQbUVrd1ZBdXYvN1RHQjdSMVpWZjJpbVJlQkNOSlRzQ0Nx?=
 =?utf-8?B?VWprZWprbWprMmJ0TmJoWVlrTGdWWHB0T3hZdzdvU1AwcnU5THQ5RW9pdGxY?=
 =?utf-8?B?aHBXMHI5d3ZVWElvZDdaT0VhVjhtYVZJMDNPWWkvN2k5dW16RjNsV2t4RlR2?=
 =?utf-8?B?U0pJLzFhRlRHcGMzRllORXRucmFDZllOMFhIQVloSTJhN0pMcGp2WkxCNzRG?=
 =?utf-8?B?bHlpWnNxcEthSjRYMWk1RGl0RGxiWTJGVkdMdkM5eHRTTnFKTkRUbUN6c2E2?=
 =?utf-8?B?TzVScmtHYVYrbTl4SDhuRDNHYUJWL3IxNVVUZGxYZnY4YWw5OWpzbGhNL3VK?=
 =?utf-8?B?dkxhQTlvL3FjZ0l4Yk1hYUZjWE1yOW5SQVkzaDN4dG1UUEZXcllTMVNoL1po?=
 =?utf-8?B?cEVNSHVMWkkvbmZZdDFPM2FUdkpSQ3FTblBOK2dVTFM2MXVZRkRoa3ZEWndT?=
 =?utf-8?B?SkJEZWtmUnNPUXdEZmZFS1VoMGgvLzhyM2FFSFpJNWdvekVFQTFGUGZvcFZ2?=
 =?utf-8?B?UnhzMEFDdDZRVlFZRXNNSXRRcG5BaXl0clpUNEsyUnUrVCtLSTdNZ3BFZEM5?=
 =?utf-8?B?TDdHUmVjUC9UVVJhQzhNUk5JSEhHZXZRWWtPYS9TNXBnaExpZ2tSKy9XTitF?=
 =?utf-8?B?ZEVKN1BySWw1b3I3clBGS3V5RzJKdUVSZkxGb1lmdDg4MVpRaVBrRUJDQW4x?=
 =?utf-8?B?WktYaGtxZ3lKc2QvcGxiRHl4UXhCcVZVbUxveVF3WHVoS3BmdVVzcmxMaWkz?=
 =?utf-8?B?MXIyRTBlY2dBRGMvN2sxbDF0cEJqaGtDWXh1TFdqdWNuS085eHBRd2EwM3Bq?=
 =?utf-8?B?WDVkNXRnYlFGQTNTaUMrNEFWblQwWlNrVmZ0KzUvekhYOCtBblFnUDhocmRJ?=
 =?utf-8?B?NjcrWDViam9OY2ZJMmppdFlVc2EvbGxlTU50eVBGVitqQm5CSnp1RWgyaHc2?=
 =?utf-8?B?MkhpRC9FM2V0L1lQVnNHZ0QxeFY2MmNzQU04RUVqSGF4dXJJbkZZa05FYUxG?=
 =?utf-8?B?bHQwdUVEc0NpME9MdDVyaWRrK21jeW9MSWZvYUQ3NThNN21oM2N1MGpWWWRK?=
 =?utf-8?B?UFIxTnJIUlZxeGdpVE96cFp6bW1Sa0lkcjdFeHNDUkZuK1NpbEZIZXA1NGtL?=
 =?utf-8?B?ekx3Si9ody94UzZHS2hJdFZ3bkVwa1hBVWJyeHdpTFRZY3VPZ3JqR1MwcTdL?=
 =?utf-8?B?SVBPaUhYYTlZM1JVTW0wY29hYjhGSUNOQWRhdTZHZ2hELzBwQjhEcTZOM0FI?=
 =?utf-8?B?Z0lMbWFYU3lYRVdPYzNkSGtoWHJENytsL2RCeGt3c3BBUjIzYWZuNENja0lH?=
 =?utf-8?B?SFNNWmlxbmlmcm83RGJPcVFSR05DZnJqU1ozZVB4UWRwVTFpdlRXOHFqUGQ1?=
 =?utf-8?B?SHRiUUZqSTlUMHZDSjBRcTlFblZocmVwbkpnYmVXUDN0WnZXNUdscElzWHBO?=
 =?utf-8?B?bHRudUU3aHdrSTExSUcvU0pMRDU3UzJnOHNGOW96MjZhWEdnWWRKRjBzeURD?=
 =?utf-8?B?THJtaEtLTHVkOC81Rit4V0NJWjlPVHlRSFltZmxOUFN0bEZYc3BNc3BjcTNW?=
 =?utf-8?B?dkNUcGgzckc2WXo2dVVIQVlqYURwTVJUQk56Y0x1UGNJbkpDTWFVdG5jVG1F?=
 =?utf-8?B?VlpkeDlvdWJhQm94YkluMzNUaXNPYlg3ZU4rdmhyQlZ0Qm81R2VJMkFJZUxT?=
 =?utf-8?Q?GtA/H+jmkE4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6CEB6160F66C94BBFF769D50C6727A9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c9b904-42e0-4c6b-e749-08d994938f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 13:06:13.1284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: conor.dooley@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

T24gMjEvMTAvMjAyMSAxMzoyMywgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+DQo+IE9uIFRodSwgT2N0IDIxLCAyMDIxIGF0IDExOjA5
IEFNIEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2Fs
LmNvbT4gd3JvdGU6DQo+PiBIaSBBcm5kIGFuZCBPbG9mLA0KPj4NCj4+IEkgaGF2ZSBhbiBvbGQg
cGF0Y2hzZXQgZm9yIFJJU0MtViBkdHMgY2xlYW51cHMgd2hpY2ggSSBzZW50IHRvIG1haWxpbmcg
bGlzdHMgaW4NCj4+IEF1Z3VzdCAyMDIxICh2MSwgdjIpLCByZXNlbnQgaW4gU2VwdGVtYmVyIGFu
ZCBwaW5nZWQgdHdvIHRpbWVzLiAgVGhleSBnb3Qgc29tZQ0KPj4gcmV2aWV3IChmcm9tIEFsZXhh
bmRyZSBHaGl0aSBmb3IgU2lGaXZlLCBmcm9tIENvbm9yIERvb2xleSBmb3IgTWljcm9jaGlwKSBi
dXQNCj4+IHVuZm9ydHVuYXRlbHkgUGFsbWVyIChSSVNDLVYgbWFpbnRhaW5lcikgZGlkIG5vdCBy
ZXNwb25kIGhlcmUuDQoNCk91dCBvZiBjdXJpb3NpdHkgd2hpY2ggc2VyaWVzIGlzIHRoaXMgb25l
PyBJcyBpdCB0aGUgb25lIHdpdGggdGhlIA0KcGxpYy9jbGludCBjaGFuZ2VzPw0KUHJldHR5IHN1
cmUgdGhhdCBJIGhhdmUgdGFrZW4gdGhlbSBpbiBpbnRlcm5hbGx5LCBidXQgSSBhbSBnb2luZyB0
byANCnN1Ym1pdCBhIGJ1bmNoDQpvZiBjaGFuZ2VzIHRvIG91ciBkZXZpY2UgdHJlZSBzb29uICh0
bSkgYW5kIHdhbnQgdG8gbWFrZSBzdXJlIEkgaGF2ZSB0aGUgDQpyaWdodA0KZGVwZW5kZW50IHNl
cmllcyBsaXN0ZWQuDQoNCj4+DQo+PiBUaGUgdXN1YWwgUklTQy1WIHBhdGNoZXMgZ28gdmlhIFBh
bG1lciB0byBMaW51cyBhbmQgSSBhbSBub3QgcGxhbm5pbmcgdG8gY2hhbmdlDQo+PiB0aGF0LCBi
dXQgSSB3YW50IHRvIGdldCB0aGVzZSBmaXhlZC4NCj4+DQo+PiBDb3VsZCB5b3UgZ3JhYiB0aGVz
ZSB0byBzb2MgdHJlZT8NCj4gU3VyZSwgSSBjYW4gYWRkIHRoZW0gdG8gYSBzZXBhcmF0ZSBicmFu
Y2ggaW4gdGhlIHNvYyB0cmVlLCBpbiBjYXNlIHRoZQ0KPiByaXNjdiBtYWludGFpbmVycw0KPiB0
YWtlIHRoZW0gYWZ0ZXIgYWxsLiBJIG5vdGljZSB0aGF0IHlvdSBoYXZlIG9ubHkgQ2MnZCBQYWxt
ZXIsIGJ1dCBub3QNCj4gdGhlIG90aGVyIHR3bw0KPiBtYWludGFpbmVycyBvciB0aGUgUklTQy1W
IG1haW5saW5nIGxpc3QuIEFkZGluZyB0aGVtIGhlcmUgdG8gbWF5YmUgZ2V0IHRoZWlyDQo+IGF0
dGVudGlvbi4NCj4NCj4gICAgICAgICAgQXJuZA0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QNCj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2DQoNCg0K
