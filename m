From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos: Remove unused non-dt support for dwmci
 controller
Date: Tue, 27 Nov 2012 10:01:22 +0900
Message-ID: <15d601cdcc3a$b7743c30$265cb490$%kim@samsung.com>
References: <1353914155-1716-1-git-send-email-thomas.abraham@linaro.org>
 <CAH9JG2X_=Vr=52BY=vjZVtf9fzSox2KMjXGr0U4uAJu6MHjwQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25291 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932495Ab2K0BBd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 20:01:33 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME4003Q9G5JIIF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 10:01:22 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME40097HG69EA50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 10:01:22 +0900 (KST)
In-reply-to: <CAH9JG2X_=Vr=52BY=vjZVtf9fzSox2KMjXGr0U4uAJu6MHjwQw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, tgih.jun@samsung.com, jh80.chung@samsung.com, yuvaraj.cd@gmail.com, girish.shivananjappa@linaro.org, linux-arm-kernel@lists.infradead.org

Kyungmin Park wrote:
> 
> On 11/26/12, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> > With device tree support enabled for dwmci controller, the unused non-dt
> > support
> > for dwmci controller can be removed.
> 
> Are there no problem to use legacy board? e.g., universal_c210.
> 
I cannot find anywhere the exynos4_dwmci_set_platdata() and
exynos4_device_dwmci are used.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
