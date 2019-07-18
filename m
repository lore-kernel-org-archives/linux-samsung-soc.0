From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 3/8] dt-bindings: exynos: Add ASV tables binding
 documentation
Date: Thu, 18 Jul 2019 16:02:11 +0200
Message-ID: <4c0ad46b-6790-b154-9c55-587b87dc204e@samsung.com>
References: <20190404171735.12815-1-s.nawrocki@samsung.com>
        <CGME20190404172234epcas1p37667ec0996000aff9297f13639908dfc@epcas1p3.samsung.com>
        <20190404171735.12815-4-s.nawrocki@samsung.com>
        <20190429172337.GA30032@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429172337.GA30032@bogus>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 4/29/19 19:23, Rob Herring wrote:
> We already have OPP tables defined for QCom CPUs to do speed bining, and 
> I just reviewed something from Allwinner for similar purposes. We can't 
> have each vendor doing their own thing here.

I tried that opp-supported-hw bitmask approach but number of OPP DT nodes
was rather high, around 200 per CPU cluster.  So I moved OPP tables to
the driver. I'm going to post next version of the patch set soon.

-- 
Regards,
Sylwester
