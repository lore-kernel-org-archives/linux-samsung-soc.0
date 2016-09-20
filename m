From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH] PM / devfreq: exynos-ppmu: Remove unused mutex from
 struct exynos_ppmu
Date: Tue, 20 Sep 2016 16:09:20 +0800
Message-ID: <CAFRkauDgNr-qmo-NqZXuR1-ybj9bu+awbCF+KTXdXb_B7MXbqw@mail.gmail.com>
References: <CGME20160920064920epcas1p20cac67f7f048c80fdcbe489e235e0cdb@epcas1p2.samsung.com>
 <1474354100-6092-1-git-send-email-axel.lin@ingics.com> <57E0EE47.4040300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <57E0EE47.4040300@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

2016-09-20 16:07 GMT+08:00 Chanwoo Choi <cw00.choi@samsung.com>:
> Hi,
>
> If you remove the mutex, you better to remove
> the header "#include <linux/mutex.h>" from exynos-ppmu.c.
Yes, I did remove it in this path.
