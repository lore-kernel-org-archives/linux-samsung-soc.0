From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 2/2] arm: Add back maximum bank limit
Date: Tue, 1 Jul 2014 11:57:36 +0100
Message-ID: <CACxGe6sKVjAaQL+6jRGAd8fJxBByF-THJ6A-ygY43LdVA7YKMQ@mail.gmail.com>
References: <1404068784-27604-1-git-send-email-lauraa@codeaurora.org>
 <1404068784-27604-2-git-send-email-lauraa@codeaurora.org>
 <20140630104350.600EDC40F52@trevor.secretlab.ca>
 <53B1A65E.6050806@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53B1A65E.6050806@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Tushar Behera <trblinux@gmail.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 30, 2014 at 7:03 PM, Laura Abbott <lauraa@codeaurora.org> wrote:
> On 6/30/2014 3:43 AM, Grant Likely wrote:
>>
>> Instead of splitting early_init_dt_scan(), the call to
>> early_init_dt_scan() could probably be moved after the
>> of_flat_dt_match_machine() call. It's at least worth a try. Looking at
>> the code I don't see anything obvious that requires the
>> early_init_dt_scan() code to run first.
>>
>
> of_flat_dt_match_machine -> of_flat_dt_match which uses
> initial_boot_params which isn't set until early_init_dt_scan. I had the
> same thought about just rearranging but we still need something to be
> set before doing the scan, hence the split.

Fair enough.

>> Once you've got the mdesc pointer, you've could set the limit before
>> doing the full scan. Or, better yet because this is a fix for broken
>> data, you could call a dt_fixup hook on the mdesc. Then exynos is the
>> only platform that needs special treatment. The best thing for exynos to
>> do is fix the buggy data by clearing the bogus entries. Then there's no
>> need to reintroduce early_init_dt_add_memory_arch() for ARM.
>>
>
> The fixup hook does sound better. The flow would become
>
> setup_machine_fdt
>         - early_init_dt_verify
>         - of_flat_dt_match_machine
>         - mdesc->dt_fixup
>         - early_init_dt_scan_all
>
> I notice that powerpc already has a DT fixup infrastructure but I don't see
> any such thing for ARM. How much of that do you think could and should be
> leveraged for ARM?

Not much. The PowerPC fixup infrastructure is based on having an
OpenFirmware implementation and the fixups are performed by executing
Forth commands in OFW before flattening the tree and killing OFW
context. For ARM, any DT fixup hooks should directly use libfdt calls.

g.
