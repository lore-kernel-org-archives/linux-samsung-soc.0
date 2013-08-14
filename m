From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung-fixes-2 for v3.11
Date: Wed, 14 Aug 2013 00:15:03 -0700
Message-ID: <CAOesGMini9xy5AjVzQinvGS3c2eA9dcPYRJxKf0R0z84FUSHGg@mail.gmail.com>
References: <51FFE30A.5040800@samsung.com> <87ob92pv1x.fsf@kernel.org>
 <10a101ce98bd$c004bd20$400e3760$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <10a101ce98bd$c004bd20$400e3760$@org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 14, 2013 at 12:13 AM, Kukjin Kim <kgene@kernel.org> wrote:
> Kevin Hilman wrote:
>>
>> Kukjin Kim <kgene.kim@samsung.com> writes:
>>
>> > The following changes since commit
>> 5ae90d8e467e625e447000cb4335c4db973b1095:
>> >
>> >   Linux 3.11-rc3 (2013-07-28 20:53:33 -0700)
>> >
>> > are available in the git repository at:
>> >
>> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> > tags/samsung-fixes-2
>> >
>> > for you to fetch changes up to 35f8550c8f27968af94ba5235cc611e3b6d86981:
>> >
>> >   ARM: SAMSUNG: fix to support for missing cpu specific map_io
>> > (2013-07-30 13:30:57 +0900)
>>
>> In the future, please send arm-soc pull request to arm@kernel.org also,
>> this makes filtering easier when non-Arnd/Olof folks (like me) are
> helping.
>>
> OK, it's not difficult, BTW I'm not sure what the difference of
> linux-arm-kernel ml and arm(at)kernel.org.

arm@kernel.org goes to Arnd, Kevin, Russel and myself. I think there
might be one or two more people on there, but in general it's
arm-soc+arm maintainers.

We haven't wanted to add it to MAINTAINERS since we want to keep the
traffic mostly to the pull requests of platform maintainers, and not
as a cc of patch postings, to keep the traffic volume manageable. :)


-Olof
