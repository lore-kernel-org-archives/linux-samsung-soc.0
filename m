From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 07/14] regulator: s2mps11: Choose number of supported
 regulators during probe
Date: Wed, 12 Feb 2014 16:00:48 +0100
Message-ID: <1392217248.22265.28.camel@AMDC1943>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-8-git-send-email-k.kozlowski@samsung.com>
 <CAKew6eV4t-CybRe0h3jVTFH5xZvj5+XLVTKdNyWyYNby_jMnZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAKew6eV4t-CybRe0h3jVTFH5xZvj5+XLVTKdNyWyYNby_jMnZQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 2014-02-12 at 15:31 +0530, Yadwinder Singh Brar wrote:
> Hi,
> 
> 
> >
> > +       dev_type = platform_get_device_id(pdev)->driver_data;
> > +       switch (dev_type) {
> > +       case S2MPS11X:
> > +               s2mps11->rdev_num = ARRAY_SIZE(s2mps11_regulators);
> > +               regulators = s2mps11_regulators;
> 
> How about creating and passing copy of s2mps11_regulators at runtime
> and making s2mps11_regulators __initdata ?

Sounds good, I'll add this in next version of patchset.


Best regards,
Krzysztof
