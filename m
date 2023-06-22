Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B583CEB64DC
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 22 Jun 2023 22:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjFVWdS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 22 Jun 2023 18:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjFVWdQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 18:33:16 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A1A1A1;
        Thu, 22 Jun 2023 15:33:14 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35MHWi4G007588;
        Thu, 22 Jun 2023 15:33:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=/yhLX8NWW8U/QmP4LrAjceHs9yqWbSvnevxPBJNAWWI=;
 b=QiRjgV4iI3q/DQ5GwmQZdXU4dl8Puk3TKIAAS2zouzA55hu3Q9mDlQxb7pgpc8FdJg03
 kbw3CgFGwBf/L4kL23tbbBR4c/x4F1CqPN6R7zuoU+slIdPOolK2IDoU+igg2UdzRC9A
 mem5HJrqs4AhYCx9BVwB2exEI/FCXDqKUXQNKocimbo9+m48zMgIUCglLIKiE6XG/MBe
 q0nKmBB3/TfEdIP3bY+Kfu5ct/uGv8mzFtwDn7n3q3m81wft+/uc3UfgAtWsJ2PUI8aq
 9sGfeo0J6Byv41uD75UDqF0XjXg/oVZQ6Rayd6rtNGVPRXwPF1WEs4l6at8DEJnn9VwA Cw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3r9brutgjy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Jun 2023 15:33:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1687473190; bh=/yhLX8NWW8U/QmP4LrAjceHs9yqWbSvnevxPBJNAWWI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Io8ti/bmS9zksHwqHBwXPs5EfYjI7ge+bFd+CWAvu//lZasGAMwP88f9npKOVErjY
         9u420K9jg6DFkHbp4vUO/rEiwyyB9+jwmR1nvmZd1dGZbsIfXRmLZi852wpAVPk5Fe
         qy4+8khCJ6AR0qe6xC43jhVicvODd+fFfkY5tL/zToKYZpf3kX9CROqeNNfm2JeqkJ
         xYXaQoZUgntyU5vSlIOK/eG69dXxCF0ZOa37EUBrIbkJ7b7b/RzxMmhgA7tRB8/+6C
         S2sPWxguEspA0laNvCTDqPk8LArmCvQCWX4eVlZNGrAfpeTmSBHd8+bxCIALZqjI/0
         I5du+UOf5n+Ng==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9892E4012E;
        Thu, 22 Jun 2023 22:33:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 70790A008A;
        Thu, 22 Jun 2023 22:33:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=BpDO7HHQ;
        dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B975840136;
        Thu, 22 Jun 2023 22:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSeZ0PY9Jd3u4NwPeB/mEO6By4DIs+Xc9EY0HlByoORSXvlTl9rBAbOSNeM5cJskNuacbnV0o5FI3bB5waEeueHJOCa0Wh6YEXMKx3B3+iBlOgdj8rkVRbX1HPH4PHGAlprkT9B1p2oEbQUEnomfLo4kfx08L3XtRY7ELE+boPBS5QciyUXawGl2btUrkTNX3Qoss3HOd8hlrcKZfU2KLWQWSswLb6yO07S2iQQM3y2ySbM5zY0g4e/QyGqqzt4rKO+Na4iM66zv/4nvKBrwYFjE//jqOymZXHyMOniFFPWHEheVguh+lq0JQSxcu+k8QE4WEVU9iFus/Ww3cFQk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yhLX8NWW8U/QmP4LrAjceHs9yqWbSvnevxPBJNAWWI=;
 b=Ofi064yOzmdNxb9mLypcbYVJ2W1927eMHUZI9M4w3YC13wE/XiA8vf9vN7QsLLieeukzKxrQv2bG+GtH3ZafoIGLo0zHhNf0HQWHI80ctZ3scfiCKbI8wrGZd/+0Mi4Q1GA/GybvgDzej8SM4ZWwd7/0j0tmhXJNolDLbcwePU0wUC68jbFIiho4i1O51MvuhxiwYPZaGSX9as85afADMBZPC9zvfNsdtYHsydH3LbIAssbTQj80q5lH7uolrT0Hqb1wUEazFRswvu10FhAMVzr3aCrr1AdW2Bh2MFNT6lvj/sz2TxaCBCyDwsgV7TIfNyY/gGOJwmCkDC+oQQnGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yhLX8NWW8U/QmP4LrAjceHs9yqWbSvnevxPBJNAWWI=;
 b=BpDO7HHQlYrKyUlG10xJH40URwkB+tZMHffbwvB6MW2lt5qjjZBOL5dlVFOyZn2FPseF56NZOYpjFMnRUHLrMXd+YaskPvwGVQqcQsg67nYLb2JVDXblsEUKIHNxcqG2KnLpVZHUo8nHmveZY3u9TNQyBxQSUHo14/vAC9TI2pk=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 22:33:01 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 22:33:00 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?SmFrdWIgVmFuxJtr?= <linuxtardis@gmail.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "mauro.ribeiro@hardkernel.com" <mauro.ribeiro@hardkernel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: usb: dwc3: HC dies under high I/O load on Exynos5422
Thread-Topic: usb: dwc3: HC dies under high I/O load on Exynos5422
Thread-Index: AQHZoAA7xJCmtd8rSk6hlKylfwPXx6+XcvmA
Date:   Thu, 22 Jun 2023 22:33:00 +0000
Message-ID: <20230622223255.xawjfenb2tsjdmmg@synopsys.com>
References: <a21f34c04632d250cd0a78c7c6f4a1c9c7a43142.camel@gmail.com>
In-Reply-To: <a21f34c04632d250cd0a78c7c6f4a1c9c7a43142.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB7600:EE_
x-ms-office365-filtering-correlation-id: 1a608850-88a5-44da-4764-08db7370a278
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cHa2ziL9Tm06PVctyGiqdemof6RHBLLYFL1FK0t+bEnOita+RQjH9AtgRyjjr1+VT3l2Xq6TxMiPOpiLAXjfNnOsV6BJtD8xzgcAkLCm+9EZS/bJ/e7aL+BdY0Ty00gKhaQG4u04++UK3hSrY9xM3h7dKALjfO28eteiG4tsqb6uf1KMpx8ny6kws3oL9S5P/tK0vSjf12mRSoHEWiNqGdwVe84mWHxPlal58C+xlS+D2qAIDE+3pXRMOsqaLo3JmWrlVBS6whwmr1MIhs3AVPaFin7e/9H/reO8pczDHVy1+yu6kn4JC23oMKn5UN8G+1a1K8IkLz5TF2/kqYXksC4n44X/i/o0V6+yQni5gKUD5YyDVmCGGgACDGQeW7HWkmCJk8tavSysIR5ybGJQScflCtYEEJOJbY7+jCWQxscA8/RsJACqP6QPBX4U5utK6K0lXN7Nk5ZKQDhGLi9HdYlecq9JeeFSAva8y/DZHATV4KKX2VJi7H6hlMSz5cOUwdzSiUN4qzzwoUlU175ujYB+wo7xWHpB2LMktTnphoPh+UxVNUuRcCkzLbjQDsDaWVw/HRSLImSKanrU9gfxETQlTWD/LavM0OThv/Indns1vDzxVm4Ymjoz9Iuw43z2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(478600001)(71200400001)(83380400001)(5660300002)(6506007)(6486002)(1076003)(54906003)(66946007)(4326008)(76116006)(8676002)(41300700001)(66446008)(64756008)(66556008)(66476007)(6916009)(8936002)(66574015)(2906002)(36756003)(26005)(6512007)(186003)(122000001)(38100700002)(38070700005)(316002)(2616005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjJFeGpON2F2Q2JZOUo1WEp6WW9IUDVQYWdDdk1yN2JYOWpGYy9KTjVXWTNw?=
 =?utf-8?B?b2l6NGN0a0F4bys5NWJFOFExY2tqZUIzWndPc280cXp0REt4UVI4VzQ5ZlY4?=
 =?utf-8?B?M29zcVNWb3d2YmROVU1pY3RBRG8zb2JEOUNNVUVxbnQrZ3NBZGkvQ1RVT1N5?=
 =?utf-8?B?K3U0aEZlUXBHK3VRWjZaWmlEYTBLajF1OTVMZlRlV1Y1dVNybjEwbHJabXhz?=
 =?utf-8?B?c3FsL1ZOOG8raW04VUlUMzZMYWRmNEZBcnZFV2kvUXU2VDRwSklTdkZSM3hk?=
 =?utf-8?B?T21HUEdSMjZ4bDZYd3lmS3VpMTdRcEVjaUY0RUxGWmNyWGFWbXNlQjkxZFdp?=
 =?utf-8?B?S01vUXpzUE4wVnE1dS9tOXBQejVDVll3RStiZENhUzM4K0VTa05yaEJMdWRC?=
 =?utf-8?B?Wmx0UTJ5NitEY2pELzRqRjVGZE1NbXd6TXhxcWQ5d3l5OVFvclBzbHU0TUNh?=
 =?utf-8?B?NGtnaFhkQVgzdkVQMUtNUnpnTnNaWkw2M1V3LzE4WlNWRTJLNzEzTEdGZ1FD?=
 =?utf-8?B?dStQQm80d1dMWVVQejVpZThQUjFvbGZCWmZKK2p6WlRWSUlEWUNmcHBRTVJP?=
 =?utf-8?B?Zk1QVzVqL2RHYktLVGNmV0JjdXZsYVdpaDVjNnJ4R0hHczhUQXZrZTVycHFQ?=
 =?utf-8?B?QWdKaFJaTSs4aUpLWE00d2N1UGk1dUVPaS8yR2VyTEhMUjQ0QWozem54Wk12?=
 =?utf-8?B?UFBxZ0ZwMzZRRGtuT3ZUTHIrVFg2SUwxSGplbGdwRnlGdTk3L3JBL1JCMTIw?=
 =?utf-8?B?aU1pd1l5Q3I3a3YrR0NtbEZldk5WYjVBUWpmOEtWVWs4bVJLSDJzL1U2Y2Y0?=
 =?utf-8?B?S0M4OUY1Qjh6bkFXMmZ0eWhFdnFGZjdnMGM3VWNXZnlEWm5xaGZyeTFLRUND?=
 =?utf-8?B?VGV2ZEh5WE9ybFRrcmVEYm41S2hkeFhXbkVzeEZGSGF2cm9wbEF6Q0trcG9q?=
 =?utf-8?B?QUFhZE4zbXlkQ3dFRFM5NG9VUTN0M1NJS2x6M1Zmb1NpZnRScU1leW53RkIw?=
 =?utf-8?B?RnAvUC8rQVpXeEZCY3NNUnpHOEgwT2xCTGRQeDdNbjRmNWJJU1FWeGRGRXFi?=
 =?utf-8?B?dzZWTnNCWHFld29rZzliNDd4R2ZFU3NtNU9mbzBGekxtbGVGRHlKQTFSOGZU?=
 =?utf-8?B?V2RNbUdtV3c5K3Z2RDlmWHJ2ODV6UjhGVVpVcTNZK0pQM3NuSFR1bHdxSUpU?=
 =?utf-8?B?T2taVU9PZnlYQnFrUVRtZ3BWaUV4ei9kZVIydkJxcWFaTGY5MkpFQW9yOGpn?=
 =?utf-8?B?b2psRzRQNWxOamlndDh0SEc1dTczVi9LN0FVYkZ2OWtkWlNwMFQ3SmZsRnRa?=
 =?utf-8?B?aWtGTzJZSU5UY3BQNnFnUmJOMjBTNlNYYmZadEhaeW9nNWwzQVFvdVBpcE54?=
 =?utf-8?B?V0N1MloySjU2cGhrbjcwVmxzdjlkeU9zbTlyekMvUnJ1MkdNQnVBSTh0YVBk?=
 =?utf-8?B?dU5yVThPRjlIbzB1eWNIK096RWYyV2RTRHE3REhyU1YwVkpnSFhyK0FFd2ZM?=
 =?utf-8?B?ZDhVNm03OVRjQURySVNjZzZielRTNnJjOHMrSUNkcEh5RGszQzB1ZFllZDU5?=
 =?utf-8?B?ZEJlSUxtQ2t6Ym15RmZRUEo5OU8wd01wWXRTbGlCejg5ZnpOOVZFSzdhdTkz?=
 =?utf-8?B?VnZwclZFejhGcDBWc1I2VTZQM213UFhtV25RMGRqSlRTQjhLTGVJWVRuUTEz?=
 =?utf-8?B?VlZCcGNjekpSTU5YSkttR1hMdkhiYVhoVGkyb1hpMmxtbkc2TncyMkxQOTZr?=
 =?utf-8?B?MlBRcHhkNStYTytxWGJSQmhtWXhWc013dnkxSUpnRmFEcUVXSTJGeXYrano4?=
 =?utf-8?B?NHp6d1F1ak9jbHIrYzIvTWtFVzhDbEw0NnRQcDlFWkZnS0V4N1dSTDNhY3lt?=
 =?utf-8?B?M1ZBbTgyZUIzZCtBdVRQRzdkNFgzdWxOeXRDd1N3NUVkMmg4Y3RwMjBuVVJr?=
 =?utf-8?B?WjRzeUFTQ2pSR1YrY05YbkIrckhWZzhjcjZ4VEJXQmtBUk1LaUxpSUc3SHlx?=
 =?utf-8?B?eVltTTBROFYrM3crT2tkRjhWYm56ZW12SVA4QTBNSUROMnNXNlhTeEpUWDUr?=
 =?utf-8?B?eTVubUkwbU54UXNuUG5IWWYxNktkNmdhL3JIQ2JTajZIVXdFckI5Wmp3VDNS?=
 =?utf-8?Q?cZ++oEUORdcW8DaBsurGJ3ZSu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D957559D966C0439D82DE1C9DA3BB0E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fIyiTtItYupXaa/qodPnHtOBVS5DMG54g2GDB/qF/PKVxqRElehihISzwNMv+NsvLeFlxtYuxmYXk7dN2/WcfnwBF+NUt59hXFXRuOwFBScUPzXGWbCBVhPOHMvp3ND5x9YC6Pu8PYqGMVdh2r4BWhNhN2TRAgkJ4OAqR5Js8koBkS6a5Jla7pCuOpR/3W4QDf4a8s65PlQUl7YEKpF6KaK+7UFmTBtOxRm5jdumTKCZpXtkI/DgGSNbZ+oYumLe2phWLaoDmAePMbCPqPzDOFleJB6Mvg8Oqtw4tO+PV+zwlrGrJH2qeBwg+NtpfZmKaaL8MFe+bksh1Ugc3NMTcZrQuObTt6hxlWOmv084lTF3XWMPUdVG0+ML6MdTpetPuCiN0I6RBN0mqH8VXScfqsqDrRUSrAolQNzC/V79lsxdqj8W7pJUMWapiRD5L7loAP86TIhoC0wPr1GJ/tltJMJXsDKcKnO3dneoWfYoVywlRfj1BC3kOCRH2o0RLjnxVcNf/1UPVxCBJjAbx3avA2iLODvQyXmynIES/t4kRhS2bYLwjF7sHjHaMFc9GQVRPQQL/TFQnVdDwIkaVagm07d13cXe7QWpSR5RJBhxgh8EB3Pr51y8o0HBI0IiFcDIZqxcd5eEnNvGJ7SxxyoypIwX7/d0AXHhnJxd+SwgWybf4YDptRxtNH73WmcheEY+jPnls004lHacpXYv1x3yXmsIRw4/tIaY8pI+4iR+IHwPP21Q0tVfntRPX1HAjvstdBl86JCKQNdzp11Bi5KH+UgyRv1DVu0NBNq/raDhQ3Z5S9wWyXjL77ngka5POxgu+Ss1viNfLQsEO2k/cJXD1vUoOP0wPOPksPOlVWmEDkZBQNhgKtqSGYbtnkTvCd1cyUpKor+L/TksWiqJwPfalw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a608850-88a5-44da-4764-08db7370a278
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 22:33:00.1804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdPl8RkUa+ffi/VL6fb5IgVCjdM/6KOEpVJQvZpwbpW7NTdti3082gAJkR8up2rGP8q0iZSU6KMG4UXoRZ1r3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
X-Proofpoint-ORIG-GUID: YHsvN4LPp_wXL_uoZFtz1WZyt97PTBpp
X-Proofpoint-GUID: YHsvN4LPp_wXL_uoZFtz1WZyt97PTBpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_16,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306220192
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

U29ycnkgZm9yIHRoZSBkZWxheSBpbiByZXNwb25zZS4gSSB3YXMgYXdheS4NCg0KT24gRnJpLCBK
dW4gMTYsIDIwMjMsIEpha3ViIFZhbsSbayB3cm90ZToNCj4gSGkgYWxsLA0KPiANCj4gSSd2ZSBk
aXNjb3ZlcmVkIHRoYXQgb24gcmVjZW50IGtlcm5lbHMgdGhlIHhIQ0kgY29udHJvbGxlciBvbiBP
ZHJvaWQNCj4gSEMyIGRpZXMgd2hlbiBhIFVTQi1hdHRhY2hlZCBkaXNrIGlzIHB1dCB1bmRlciBh
IGhlYXZ5IEkvTyBsb2FkLg0KPiANCj4gVGhlIGhhcmR3YXJlIGluIHF1ZXN0aW9uIGlzIHVzaW5n
IGEgRFdDMyAyLjAwYSBJUCB3aXRoaW4gdGhlIEV4eW5vczU0MjINCg0KSnVzdCB3YW50IHRvIGNs
YXJpZnksIHRoaXMgaXMgZHdjX3VzYjMgdjIuMDBhIGFuZCBub3QgZHdjX3VzYjMxLg0KDQo+IHRv
IHByb3ZpZGUgdHdvIGludGVybmFsIFVTQjMgcG9ydHMuIE9uZSBvZiB0aGVtIGlzIGNvbm5lY3Rl
ZCB0byBhDQo+IEpNUzU3OCBVU0ItdG8tU0FUQSBicmlkZ2UgKE9kcm9pZCBmaXJtd2FyZSB2MTcz
LjAxLjAwLjAyKS4gVGhlIGJyaWRnZQ0KPiBpcyB0aGVuIGNvbm5lY3RlZCB0byBhIEludGVsIFNT
RFNDMktHMjQwRzggKGZpcm13YXJlIFhDVjEwMTMyKS4NCj4gDQo+IFRoZSBjcmFzaCBjYW4gYmUg
dHJpZ2dlcmVkIGJ5IHJ1bm5pbmcgYSByZWFkLWhlYXZ5IHdvcmtsb2FkLiBUaGlzDQo+IHRyaWdn
ZXJzIGl0IGZvciBtZSB3aXRoaW4gdGVucyBvZiBzZWNvbmRzOg0KPiANCj4gJCBmaW8gLS1maWxl
bmFtZT0vZGV2L3NkYSAtLWRpcmVjdD0xIC0tcnc9cmVhZCAtLWJzPTRrIFwNCj4gIC0taW9lbmdp
bmU9bGliYWlvIC0taW9kZXB0aD0yNTYgLS1ydW50aW1lPTEyMCAtLW51bWpvYnM9NCBcDQo+ICAt
LXRpbWVfYmFzZWQgLS1ncm91cF9yZXBvcnRpbmcgLS1uYW1lPWlvcHMtdGVzdC1qb2IgXA0KPiAg
LS1ldGEtbmV3bGluZT0xIC0tcmVhZG9ubHkNCj4gDQo+IEZJTyBvdXRwdXQgdGhlbiBmb2xsb3dz
IHRoaXMgcGF0dGVybjoNCj4gDQo+IGlvcHMtdGVzdC1qb2I6IChnPTApOiBydz1yZWFkLCBicz0o
UikgNDA5NkItNDA5NkIsIChXKSA0MDk2Qi00MDk2QiwgKFQpDQo+IDQwOTZCLTQwOTZCLCBpb2Vu
Z2luZT1saWJhaW8sIGlvZGVwdGg9MjU2DQo+IC4uLg0KPiBmaW8tMy4xNg0KPiBTdGFydGluZyA0
IHByb2Nlc3Nlcw0KPiBKb2JzOiA0IChmPTQpOiBbUig0KV1bMi41JV1bcj0zNDFNaUIvc11bcj04
Ny4yayBJT1BTXVtldGEgMDFtOjU3c10NCj4gSm9iczogNCAoZj00KTogW1IoNCldWzQuMiVdW3I9
MzQwTWlCL3NdW3I9ODcuMWsgSU9QU11bZXRhIDAxbTo1NXNdDQo+IEpvYnM6IDQgKGY9NCk6IFtS
KDQpXVs1LjglXVtyPTMzN01pQi9zXVtyPTg2LjJrIElPUFNdW2V0YSAwMW06NTNzXQ0KPiBKb2Jz
OiA0IChmPTQpOiBbUig0KV1bNy41JV1bcj0zNjlNaUIvc11bcj05NC41ayBJT1BTXVtldGEgMDFt
OjUxc10NCj4gSm9iczogNCAoZj00KTogW1IoNCldWzkuMiVdW3I9MzY0TWlCL3NdW3I9OTMuMmsg
SU9QU11bZXRhIDAxbTo0OXNdDQo+IEpvYnM6IDQgKGY9NCk6IFtSKDQpXVsxMC44JV1bcj0zNjNN
aUIvc11bcj05Mi45ayBJT1BTXVtldGEgMDFtOjQ3c10NCj4gSm9iczogNCAoZj00KTogW1IoNCld
WzEyLjUlXVtyPTM0OE1pQi9zXVtyPTg4LjBrIElPUFNdW2V0YSAwMW06NDVzXQ0KPiBKb2JzOiA0
IChmPTQpOiBbUig0KV1bMTQuMiVdW3I9MzQ4TWlCL3NdW3I9ODguMGsgSU9QU11bZXRhIDAxbTo0
M3NdDQo+IEpvYnM6IDQgKGY9NCk6IFtSKDQpXVsxNS44JV1bcj0zNzdNaUIvc11bcj05Ni40ayBJ
T1BTXVtldGEgMDFtOjQxc10NCj4gSm9iczogNCAoZj00KTogW1IoNCldWzE3LjUlXVtyPTM3Mk1p
Qi9zXVtyPTk1LjJrIElPUFNdW2V0YSAwMW06MzlzXQ0KPiBKb2JzOiA0IChmPTQpOiBbUig0KV1b
MTguMyVdW3I9NzcuME1pQi9zXVtyPTE5LjBrIElPUFNdW2V0YSAwMW06MzhzXQ0KPiBKb2JzOiA0
IChmPTQpOiBbUig0KV1bMjAuMCVdW2V0YSAwMW06MzZzXQ0KPiA8IGxpbmUgd2l0aG91dCBwcm9n
cmVzcyByZXBlYXRlZCBtYW55IHRpbWVzOyB4SEMgaXMgbm93IHVucmVzcG9uc2l2ZSA+DQo+IEpv
YnM6IDQgKGY9NCk6IFtSKDQpXVs0NS44JV1bZXRhIDAxbTowNXNdDQo+IGZpbzogaW9fdSBlcnJv
ciBvbiBmaWxlIC9kZXYvc2RhOiBObyBzdWNoIGRldmljZTogcmVhZA0KPiBvZmZzZXQ9MTgyMDgz
OTkzNiwgYnVmbGVuPTQwOTYNCj4gZmlvOiBwaWQ9MTg2MywgZXJyPTE5L2ZpbGU6aW9fdS5jOjE3
ODcsIGZ1bmM9aW9fdSBlcnJvciwgZXJyb3I9Tm8gc3VjaA0KPiBkZXZpY2UNCj4gPCBhbmQgc28g
b24gPg0KPiANCj4gRG1lc2cgY29udGFpbnMgdGhlIGZvbGxvd2luZyBvdXRwdXQ6DQo+IA0KPiBb
IDI2Ni4zMTA3NjddIHhoY2ktaGNkIHhoY2ktaGNkLjguYXV0bzogeEhDSSBob3N0IGNvbnRyb2xs
ZXIgbm90DQo+IHJlc3BvbmRpbmcsIGFzc3VtZSBkZWFkDQo+IFsgMjY2LjMxNzM4OF0geGhjaS1o
Y2QgeGhjaS1oY2QuOC5hdXRvOiBIQyBkaWVkOyBjbGVhbmluZyB1cA0KPiBbIDI2Ni4zMjI3MTBd
IHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zMjY0OTddIHVzYiA0LTE6IGNt
ZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zMzAzMTNdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIg
LTEwOA0KPiBbIDI2Ni4zMzQwOTZdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2
Ni4zMzc5NDJdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zNDE3NDZdIHVz
YiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zNDU1NjFdIHVzYiA0LTE6IGNtZCBj
bXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zNDkzNzJdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEw
OA0KPiBbIDI2Ni4zNTMxODddIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4z
NTcwMDBdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zNjA4MDldIHVzYiA0
LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zNjQ2MjZdIHVzYiA0LTE6IGNtZCBjbXBs
dCBlcnIgLTEwOA0KPiBbIDI2Ni4zNjg0MzldIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0K
PiBbIDI2Ni4zNzIyNDhdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zNzYw
NjNdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zNzk4NzZdIHVzYiA0LTE6
IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zODM2ODhdIHVzYiA0LTE6IGNtZCBjbXBsdCBl
cnIgLTEwOA0KPiBbIDI2Ni4zODc1MDBdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBb
IDI2Ni4zOTEzMTRdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zOTUxMjdd
IHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni4zOTg5NDNdIHVzYiA0LTE6IGNt
ZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni40MDI3NTNdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIg
LTEwOA0KPiBbIDI2Ni40MDY1NjVdIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2
Ni40MTAzNzldIHVzYiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni40MTQxNjVdIHVz
YiA0LTE6IGNtZCBjbXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni40MTgwMDNdIHVzYiA0LTE6IGNtZCBj
bXBsdCBlcnIgLTEwOA0KPiBbIDI2Ni40NDg2MjldIEJUUkZTIGVycm9yIChkZXZpY2Ugc2RhMik6
IGJkZXYgL2Rldi9zZGEyIGVycnM6IHdyIDAsIHJkDQo+IDEsIGZsdXNoIDAsIGNvcnJ1cHQgMCwg
Z2VuIDANCj4gPCBtb3JlIEZTIGVycm9ycyBmb2xsb3cgPg0KPiANCj4gVGhlIE9TIGlzIHRoZW4g
dW5hYmxlIHRvIHJlY292ZXIgKEkgaGF2ZSByb290ZnMgb24gdGhhdCBTU0QgdG9vKSBhbmQNCj4g
dGhlIGJvYXJkIG11c3QgYmUgbWFudWFsbHkgcmVzdGFydGVkLg0KPiANCj4gSSBjYW4gcmVwcm9k
dWNlIHRoZSBwcm9ibGVtIG9uIG1haW5saW5lIDYuNC1yYzYgd2l0aCBtdWx0aV92N19kZWZjb25m
aWcNCj4gKCsgQ09ORklHX0JUUkZTPXkgZm9yIHRoZSByb290ZnMpLiBJJ3ZlIGJpc2VjdGVkIHRo
ZSBwcm9ibGVtIGEgd2hpbGUNCj4gYmFjayBhbmQgdGhlIGZpcnN0IGJyb2tlbiBjb21taXQgaXMg
YjEzOGUyM2QzZGZmICgidXNiOiBkd2MzOiBjb3JlOg0KPiBFbmFibGUgQXV0b1JldHJ5IGZlYXR1
cmUgaW4gdGhlIGNvbnRyb2xsZXIiKS4gUmV2ZXJ0aW5nIHRoaXMgY29tbWl0DQo+IGxvY2FsbHkg
bWFrZXMgbXkgYm9hcmQgc3RhYmxlIGFnYWluIChGSU8gdGVzdCBhYm92ZSBjYW4gcnVuDQo+IGZv
ciA+MTAgbWludXRlcyB3aXRob3V0IGFueSBpc3N1ZXMpLg0KDQpUaGlzIGluZm8gaGVscHMgYSBs
b3QuDQoNCj4gDQo+IFRoZSBjcmFzaCBpcyBoYXBwZW5pbmcgd2hlbiB0aGUgVVNCLVNBVEEgYnJp
ZGdlIGlzIGNvbnRyb2xsZWQgYnkgdGhlDQo+IHVhcyBkcml2ZXIuIEkgaGF2ZSBub3QgdGVzdGVk
IHRoZSB1c2Itc3RvcmFnZSBkcml2ZXIgeWV0Lg0KPiANCj4gV2hhdCBkbyB5b3UgdGhpbmsgd291
bGQgYmUgYW4gYXBwcm9wcmlhdGUgZml4IGhlcmU/IE9uZSBpZGVhIEkgaGFkIGlzDQo+IHRvIGFk
ZCBhIE9kcm9pZC1zcGVjaWZpYyBxdWlyayB0byBEV0MzIHRvIG5vdCBlbmFibGUgQXV0b1JldHJ5
IGhlcmUuDQo+IEhvd2V2ZXIsIEknbSBub3QgZW50aXJlbHkgc3VyZSB0aGlzIGlzIGlzb2xhdGVk
IHRvIE9kcm9pZCBib2FyZHMuDQo+IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IG5lZWQg
bWUgdG8gZG8gc29tZSBtb3JlIGV4cGVyaW1lbnRzLg0KPiANCg0KVGhpcyBmYWlsdXJlIGluZGlj
YXRlcyB0aGF0IHdoaWNoZXZlciBkZXZpY2UgeW91J3JlIHRlc3RpbmcgYWdhaW5zdA0KY291bGQg
bm90IHJldHJ5IHdpdGggYnVyc3QgKE51bVAgIT0gMCkgYWZ0ZXIgYSBDUkMgZXJyb3IuIEFmdGVy
IGEgcGVyaW9kDQpvZiB0aW1lLCB0aGUgaG9zdCB0aW1lZCBvdXQgYW5kIGF0dGVtcHRlZCB0byBy
ZXN0b3JlIGl0cyBvcGVyYXRpb25zIGJ5DQpzdG9waW5nIHRoZSBhY3RpdmUgdHJhbnNmZXJzIHdp
dGggYSBTdG9wLWVwIGNvbW1hbmQuIEhvd2V2ZXIsIGZvciBzb21lDQpyZWFzb24sIHRoZSBob3N0
IGRvZXNuJ3QgcmVzcG9uZCB0byB0aGlzIGNvbW1hbmQuIFRoZSBjcmFzaCB5b3Ugb2JzZXJ2ZWQN
CmlzIHByb2JhYmx5IGEgc2VwYXJhdGUgaXNzdWUuIFRoZSBtYWluIGlzc3VlIGlzIHdoeSB0aGUg
aG9zdCBkb2Vzbid0DQpyZWNlaXZlIGEgY29tbWFuZCBjb21wbGV0aW9uIGV2ZW50LiBJZiB5b3Un
cmUgb3VyIGRpcmVjdCBjdXN0b21lciwgeW91DQpjYW4gc3VibWl0IGEgU1RBUiByZXF1ZXN0IGZv
ciBvdXIgc3VwcG9ydC4gSSdtIG5vdCBhd2FyZSBvZiB0aGlzIHR5cGUgb2YNCmZhaWx1cmUgcmVs
YXRlZCB0byBBdXRvUmV0cnkuIEhvd2V2ZXIsIGdpdmVuIGhvdyBvbGQgdGhpcyBjb250cm9sbGVy
DQp2ZXJzaW9uIGlzIChvdmVyIGEgZGVjYWRlIGFnbyksIEkgY2FuJ3QgYmUgc3VyZS4NCg0KSSB0
aGluayBpZiB5b3UgdHJ5IHRvIHRlc3QgYWdhaW5zdCBhIGRpZmZlcmVudCBkZXZpY2UsIHlvdSBt
YXkgbm90DQpvYnNlcnZlIHRoaXMgc2FtZSBmYWlsdXJlLg0KDQpUbyByZXNvbHZlIHRoaXMsIHBs
ZWFzZSBsb29rIGludG8gb3VyIHN1cHBvcnQgdGVhbSB0byBpbnZlc3RpZ2F0ZQ0KZnVydGhlciB0
byBzZWUgd2hldGhlciBpdCdzIGEgc2V0dXAgaXNzdWUuIE90aGVyd2lzZSwgd2UgY2FuIGRpc2Fi
bGUNCnRoaXMgZmVhdHVyZSBmb3IgZHdjX3VzYjMgdjIuMDBhLiBEZXBlbmRpbmcgb24gaG93IGJh
ZCB0aGUgQ1JDIGVycm9yDQpyYXRlIGlzICh3aGljaCBzaG91bGQgYmUgbG93KSwgdGhpcyBzaG91
bGQgbm90IGFmZmVjdCBwZXJmb3JtYW5jZSBtdWNoLg0KSSBkb24ndCB0aGluayB0aGlzIG5lY2Nl
c3NhcmlseSBuZWVkcyBhIG5ldyBEVCBwcm9wZXJ0eS4NCg0KU29tZXRoaW5nIGxpa2UgdGhpczoN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdj
My9jb3JlLmMNCmluZGV4IDBiZWFhYjkzMmU3ZC4uMWJmZDhiMTI3MjQwIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQpA
QCAtMTIwOSw4ICsxMjA5LDkgQEAgc3RhdGljIGludCBkd2MzX2NvcmVfaW5pdChzdHJ1Y3QgZHdj
MyAqZHdjKQ0KIAkJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dVQ1RMMSwgcmVnKTsNCiAJ
fQ0KIA0KLQlpZiAoZHdjLT5kcl9tb2RlID09IFVTQl9EUl9NT0RFX0hPU1QgfHwNCi0JICAgIGR3
Yy0+ZHJfbW9kZSA9PSBVU0JfRFJfTU9ERV9PVEcpIHsNCisJaWYgKCFEV0MzX1ZFUl9JUyhEV0Mz
LCAyMDBBKSAmJg0KKwkgICAgKGR3Yy0+ZHJfbW9kZSA9PSBVU0JfRFJfTU9ERV9IT1NUIHx8DQor
CSAgICAgZHdjLT5kcl9tb2RlID09IFVTQl9EUl9NT0RFX09URykpIHsNCiAJCXJlZyA9IGR3YzNf
cmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dVQ1RMKTsNCiANCiAJCS8qDQoNCg0KVGhhbmtzLA0KVGhp
bmg=
