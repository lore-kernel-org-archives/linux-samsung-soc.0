From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip
 support
Date: Tue, 24 Jun 2014 08:55:18 +0530
Message-ID: <CAPdUM4OFtAnGOc3sjjBhv+MwoQWKgaFNakP0V4ReVARix-tLtg@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOp0jiZC-XqqQX7S7Dbu-_bi2unpVU2P4zAQ7VmopD27A@mail.gmail.com>
 <CAAQKjZPHc2KfmNyfchP68BJiPUFyAO_keCHMBc1YuYTj_J0kVQ@mail.gmail.com>
 <CAPdUM4Mpo_9A_+4k9ctcXKnctKOdgxkEH4Sv0TO-4Y8dZ8aiow@mail.gmail.com>
 <53A83BDE.7080005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53A83BDE.7080005@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, =?ISO-8859-1?Q?St=E9phane_Marchesin?= <marcheu@chromium.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

On 23 June 2014 20:08, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Rahul,
>
> On 23.06.2014 15:58, Rahul Sharma wrote:
>> Hi Ajay, Inki,
>>
>> I tested this series for Exynos5420 based peach-pit board,
>> Exynos5800 based Peach-pi board and Exynos5250 based
>> Snow board. I verified with the chrome test environment and
>> able to see upto Login Screen. DPMS on/off functionality and
>> S2R is also working fine for Display. therefore:
>
> What tree did you apply this patches onto? I don't see S2R support for
> Exynos5420 or 5800 in current linux-next (e.g. there are no PMU tables
> present for these SoCs).

I verified them with inflight patches and some private patches. All of them
are available at
https://github.com/exynos-reference/kernel/tree/linux-3.16-rc1-ui-s2r

Regards,
Rahul Sharma.

>
> Best regards,
> Tomasz
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
