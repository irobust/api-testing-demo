package examples.deckofcard;

import com.intuit.karate.junit5.Karate;

class DeckOfCardTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run("draw").relativeTo(getClass());
    }

    @Karate.Test
    Karate smokeTest() {
        return Karate.run("draw").tags("@smoke").relativeTo(getClass());
    }

    @Karate.Test
    Karate testWithSamplingData1() {
        return Karate.run("classpath:examples/deckofcard/draw.feature")
                .tags("@smoke")
                .karateEnv("dev")
                .systemProperty("dataFile", "data/sample1.csv");
    }
}