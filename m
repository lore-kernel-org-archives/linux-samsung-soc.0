From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 03/15] media: s5p-mfc: Replace mem_dev_* entries with an
 array
Date: Fri, 17 Mar 2017 12:29:26 +0100
Message-ID: <71641f66-1f15-e1b6-554e-f361ae131dab@samsung.com>
References: <CGME20170220133912eucas1p19fece549b0759c7e6a308e309f6d3081@eucas1p1.samsung.com>
 <1487597944-2000-1-git-send-email-m.szyprowski@samsung.com>
 <1487597944-2000-4-git-send-email-m.szyprowski@samsung.com>
 <CAKocOOOa98AJQg4YdV=HWf3QX2w5Fgf59RsrsJNf2yCi2xGM2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <CAKocOOOa98AJQg4YdV=HWf3QX2w5Fgf59RsrsJNf2yCi2xGM2g@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Shuah Khan <shuahkhan@gmail.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, shuahkh@osg.samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 02/22/2017 05:22 PM, Shuah Khan wrote:
> On Mon, Feb 20, 2017 at 6:38 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Internal MFC driver device structure contains two pointers to devices used
>> for DMA memory allocation: mem_dev_l and mem_dev_r. Replace them with the
>> mem_dev[] array and use defines for accessing particular banks. This will
>> help to simplify code in the next patches.
> Hi Marek,
>
> The change looks good to me. One comment thought that it would be
> good to keep the left and right banks in the driver code to be in sync
> with the DT nomenclature.
>
> BANK_L_CTX instead of BANK1_CTX
> BANK_R_CTX instead of BANK2_CTX

This patch doesn't apply cleanly, could you please check and resend
rebased onto my for-v4.12/media/next branch?
