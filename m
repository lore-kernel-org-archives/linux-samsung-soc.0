From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [alsa-devel][PATCH 3/3] SoC: SAMSUNG: Add WM8580 PCM Machine driver
Date: Thu, 7 Apr 2011 09:13:06 +0530
Message-ID: <BANLkTinOadw2TkNMs2_Lvmskb=yU8XYUuw@mail.gmail.com>
References: <1302136270-28776-1-git-send-email-sbkim73@samsung.com>
	<1302136270-28776-4-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:34342 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297Ab1DGDnI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Apr 2011 23:43:08 -0400
Received: by bwz15 with SMTP id 15so1679814bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Apr 2011 20:43:07 -0700 (PDT)
In-Reply-To: <1302136270-28776-4-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org

PiArc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rIHNtZGtfZGFpW10gPSB7Cj4gKyDCoCDC
oCDCoCB7Cj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAubmFtZSA9ICJXTTg1ODAgUEFJRiBQQ00g
UlgiLAo+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnN0cmVhbV9uYW1lID0gIlBsYXliYWNrIiwK
PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5jcHVfZGFpX25hbWUgPSAic2Ftc3VuZy1wY20uMCIs
Cj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuY29kZWNfZGFpX25hbWUgPSAid204NTgwLWhpZmkt
cGxheWJhY2siLAo+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLnBsYXRmb3JtX25hbWUgPSAic2Ft
c3VuZy1hdWRpbyIsCj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuY29kZWNfbmFtZSA9ICJ3bTg1
ODAtY29kZWMuMC0wMDFiIiwKPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC5vcHMgPSAmc21ka193
bTg1ODBfcGNtX29wcywKPiArIMKgIMKgIMKgIH0sIHsKPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC5uYW1lID0gIldNODU4MCBQQUlGIFBDTSBUWCIsCj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAu
c3RyZWFtX25hbWUgPSAiQ2FwdHVyZSIsCj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCAuY3B1X2Rh
aV9uYW1lID0gInNhbXN1bmctcGNtLjAiLAo+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLmNvZGVj
X2RhaV9uYW1lID0gIndtODU4MC1oaWZpLWNhcHR1cmUiLAo+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgLnBsYXRmb3JtX25hbWUgPSAic2Ftc3VuZy1hdWRpbyIsCj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAuY29kZWNfbmFtZSA9ICJ3bTg1ODAtY29kZWMuMC0wMDFiIiwKPiArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIC5vcHMgPSAmc21ka193bTg1ODBfcGNtX29wcywKPiArIMKgIMKgIMKgIH0sCj4g
K307CgpJSVJDIHRoZSBQQ00gREFJIGlzIGNvbm5lY3RlZCB0byBTZWNvbmRhcnkgaS9mIG9mIFdN
ODU4MApvbiBzb21lIFNNREtzLiBJc24ndCBpdCBzbWRrNjQxMCA/Cg==
