From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [PATCH v2 04/18] video: add command mode and command mode display
 timing
Date: Wed, 21 May 2014 20:41:39 +0900
Message-ID: <537C90F3.7050404@samsung.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-5-git-send-email-yj44.cho@samsung.com>
 <20140521110204.GB2014@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140521110204.GB2014@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

Hi Therry

On 05/21/2014 08:02 PM, Thierry Reding wrote:
> On Wed, May 21, 2014 at 01:42:56PM +0900, YoungJun Cho wrote:
>> This patch is based on videomode and display_timing relevant codes.
>> To support command mode panel, it does not need to guide its timing
>> information to the display controller like video mode panel,
>> but it requires signal timings to transfer video data.
>> So this patch adds cmdmode struct, cmdmode_display_timing struct and
>> the according helper functions to convert cmdmode_display_timing
>> to a generic cmdmode.
>
> Can you point me to relevant documentation? I wasn't able to find it by
> a quick scan through the DSI specification.
>

I'm sorry to say that there is no specific one document.

I referred to several ones, CPU interface, I80 interface and
DBI document(last time you said it).
I think this is good to check it.
[ http://cache.freescale.com/files/dsp/doc/app_note/AN4180.pdf ]

And I asked panel vendor custom service centre also.

Thank you.
Best regards YJ

> Thierry
>
