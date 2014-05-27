From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH v11 0/3] Exynos 5410 support
Date: Tue, 27 May 2014 13:44:31 -0700
Message-ID: <CAGa+x86t-4S_Qf1jvBJApyALOQHgFeZQbxAqc+YQ_5102vmWqg@mail.gmail.com>
References: <1401074613-29227-1-git-send-email-t.dakhran@samsung.com>
 <7hr43f9mmn.fsf@paris.lan> <7hd2ez9kvr.fsf@paris.lan>
 <CANhyOUcGTbbQLxYWsAZG00ENSDa4pj+MP2i7Rx=PfyqN1CY6WQ@mail.gmail.com>
 <5384F79C.6000204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5384F79C.6000204@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Chander Kashyap <chander.kashyap@linaro.org>, Romain Naour <romain.naour@openwide.fr>, Tarek Dakhran <t.dakhran@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Tarek Dakhran <t.dakhran@samsung.com>, Rob Herring <robh+dt@kernel.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 27, 2014 at 1:37 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On 27.05.2014 22:17, Tarek Dakhran wrote:
>> Hi,
>>
>> On Tue, May 27, 2014 at 9:44 PM, Kevin Hilman <khilman@linaro.org> wrote:
>>> Kevin Hilman <khilman@linaro.org> writes:
>>>
>>>> Tarek Dakhran <t.dakhran@samsung.com> writes:
>>>>
>>>>> The series of patches represent support of Exynos 5410 SoC
>>>>>
>>>>> The Exynos 5410 is the first Samsung SoC based on big.LITTLE architecture
>>>>>
>>>>> Patches add new platform description, support of clock controller and device
>>>>> tree for Exynos 5410.
>>>>>
>>>>> Has been build on Samsung Linux Kernel
>>>>>   (branch: for-next, commit: 97eae6c Merge branch 'v3.16-next/multiplatform' into for-next)
>>>>>
>>>>> Has been tested on: 1) Exynos 5410 reference board (exynos_defconfig)
>>>>>                  2) Exynos 5410 reference board (multi_v7_defconfig)
>>>>>                  3) Odroid-XU board (exynos_defconfig)
>>>>>                  4) Odroid-XU board (multi_v7_defconfig)
>>>>
>>>> Tested-by: Kevin Hilman <khilman@linaro.org>
>>>>
>>>> FYI, I boot tested this on an odroid-xu (exynos_defconfig and
>>>> multi_v7_defconfig.)
>>>
>>> Oops, I may have spoke to soon.  There seem to be some problems with
>>> multi_v7_defconfig.
>>>
>>> Applying this series directly on the commit mentioned above and testing,
>>> it works just fine using multi_v7_defconfig.
>>
>> Thank you for testing.
>>
>>> However, if I directly test the current contents of the samsung for-next
>>> branch (where this series has been merged) it no longer boots on the
>>> odroid-xu.
>>> A quick diff shows that there are some other changes to
>>> multi_v7_defconfig in the samsung/for-next branch that may be causing
>>> problems here.
>>
>> Yes. Right you are. There is no ARCH_EXYNOS defined in multi_v7_defconfig
>> at current state (branch: for-next commit: ca610da Merge branch
>> 'v3.16-next/dt-samsung-3' into for-next).
>> So booting kernel on 5410 SoC is not possible with multi_v7_defconfig.
>> Please use exynos_defconfig.
>
> I wonder if this patch isn't maybe the missing part:
>
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/32414
>
> Olof asked Kukjin to separate it from his pull requests, so it can be
> applied directly to ARM SoC tree to avoid conflicts.

Yup, samsung/for-next + that patch boots fine on the odroid-xu using
multi_v7_defconfig.

Thanks,

Kevin
