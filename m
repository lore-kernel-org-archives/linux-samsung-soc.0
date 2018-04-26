From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: linux-next: build failure after merge of the clk-samsung tree
Date: Thu, 26 Apr 2018 12:32:06 +0200
Message-ID: <c5139744-ca32-cfaf-c79a-f718ddd3c3f9@samsung.com>
References: <20180426091940.16bb1faf@canb.auug.org.au>
        <CAJKOXPexiwOyPwmAV8KQj4JAnWHYYP4o8eVYodhvRYfKFGVbNw@mail.gmail.com>
        <CGME20180426103215epcas2p32c60d927d618a82075b051b1f0624216@epcas2p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAJKOXPexiwOyPwmAV8KQj4JAnWHYYP4o8eVYodhvRYfKFGVbNw@mail.gmail.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 04/26/2018 09:29 AM, Krzysztof Kozlowski wrote:
> On Thu, Apr 26, 2018 at 1:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>> After merging the clk-samsung tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
[...]
>> Caused by commit
>>
>>   f986c0e40ff5 ("clk: samsung: Remove support for Exynos5440")
>>
>> I used the version of the clk-samsung tree from next-20180424 for today.
> 
> Thanks for the report, kbuild also mentioned this. The DTS which are
> using this header are removed in first patch of patchset... which was
> not applied yet and anyway would end in different tree. I think the
> patch removing clk header should wait till DTS change get merged into
> mainline.

Yes, let's remove all related dts parts first and then drivers in
subsequent release.

--
Regards,
Sylwester
