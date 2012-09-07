From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] ARM: samsung: clock: add clock_tree debugfs file
Date: Fri, 07 Sep 2012 19:33:36 +0200
Message-ID: <504A2FF0.1060603@gmail.com>
References: <004a01cd8cc9$40fcd900$c2f68b00$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:56664 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751402Ab2IGRdl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 13:33:41 -0400
Received: by eaac11 with SMTP id c11so1015170eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Sep 2012 10:33:40 -0700 (PDT)
In-Reply-To: <004a01cd8cc9$40fcd900$c2f68b00$%choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?EUC-KR?B?w9bBvsiv?= <jhbird.choi@samsung.com>
Cc: inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

Hi,

On 09/07/2012 09:20 AM, =C3=D6=C1=BE=C8=AF wrote:
> From: Colin Cross<ccross@android.com>
>=20
> Add a clock/clock_tree debugfs file that shows the entire clock
> hierarchy including usage counts and rates.
>=20
> Signed-off-by: Colin Cross<ccross@android.com>
> Signed-off-by: Jonghwan Choi<jhbird.choi@samsung.com>

Due to Korean characters this patch series has improper encoding:

$ git am -3 \[PATCH\ 1_2\]\ ARM\:\ samsung\:\ clock\:\ add\ clock_tree\=
 debugfs\ file.eml
fatal: cannot convert from ks_c_5601-1987 to UTF-8

Could you please fix this end resend ?

--

Thanks,
Sylwester
